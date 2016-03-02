class DashboardsController < GithubController
  def show
    @repos = github.repos
  end
end
