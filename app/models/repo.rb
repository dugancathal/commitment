class Repo < SimpleDelegator
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def deployments
    @deployments ||= Deployment.where(repo_id: to_param)
  end

  def to_param
    [self.id.to_i]
  end

  def persisted?
    false
  end
end
