class Github < SimpleDelegator
  def initialize(token)
    super(Octokit::Client.new(access_token: token))
  end
end
