class Commit < SimpleDelegator
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def story_ids
    commit.message.lines.grep(/Finishes/).map {|line| line.match(/#(\d+)/)[1].to_i }
  end
end
