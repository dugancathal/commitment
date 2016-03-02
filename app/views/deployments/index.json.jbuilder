json.array!(@deployments) do |deployment|
  json.extract! deployment, :id, :repo_id, :from, :upto, :name
  json.url deployment_url(deployment, format: :json)
end
