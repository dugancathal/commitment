class Deployment < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id
  def repo
    @repo ||= github.repo(repo_id.to_i)
  end

  def stories
    commits.flat_map do |commit|
      commit.story_ids.each_with_object({}) do |story_id, h|
        h[story_id] ||= Story.new(tracker.project(tracker_project_id).story(story_id))
        h[story_id].commits << commit.sha
      end.values
    end
  end

  def commits
    @commits ||= github.compare(repo_id, starting_commit, upto).commits.map do |c|
      Commit.new(c)
    end
  end

  def starting_commit
    from.presence || github.commits(repo_id, per_page: 50).last.sha
  end

  private

  def github
    @github ||= Github.new(user.token)
  end

  def tracker
    @tracker ||= TrackerApi::Client.new(token: user.tracker_token)
  end
end
