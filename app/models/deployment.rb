class Deployment < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id
  def repo
    puts user.token, repo_id.class, repo_id.inspect
    @repo ||= github.repo(repo_id.to_i)
  end

  def commits
    @commits ||= github.compare(repo_id, from, upto).commits
  end

  private

  def github
    @github ||= Github.new(user.token)
  end
end
