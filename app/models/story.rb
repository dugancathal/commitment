class Story < SimpleDelegator
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :commits

  def initialize(story)
    super
    @commits = []
  end
end
