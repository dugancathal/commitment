class Deployment < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id
  def repo
    @repo ||= github.repo(repo_id.to_i)
  end

  def stories
    story_ids = commits_by_story_id.keys
    stories = tracker.project(tracker_project_id).stories(filter: story_ids.join(','))
    stories_by_id = stories.each_with_object({}) {|story, h| h[story.id] = Story.new(story)}
    commits_by_story_id.map do |story_id, commits|
      stories_by_id[story_id].commits = commits.map(&:sha)
    end
    stories_by_id.values
  end

  def commits_by_story_id
    commits.each_with_object({}) do |commit, h|
      commit.story_ids.each do |story_id|
        h[story_id] ||= []
        h[story_id] << commit
      end
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
