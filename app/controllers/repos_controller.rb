class ReposController < GithubController
  def show
    @repo = Repo.new(github.repo(repo))
  end

  private
  def repo
    "#{params[:owner]}/#{params[:id]}"
  end
end
