Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user,repo:status,repo_deployment,repo'
  provider :bitbucket, ENV['BITBUCKET_KEY'], ENV['BITBUCKET_SECRET'], scope: 'user,repo'
end
