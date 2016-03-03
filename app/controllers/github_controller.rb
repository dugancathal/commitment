class GithubController < ApplicationController
  before_filter :authenticated?

  private
  def github
    @github ||= Octokit::Client.new(access_token: current_user.token)
  end
  helper_method :github
end
