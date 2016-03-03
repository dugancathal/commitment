class AddTrackerProjectIdToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :tracker_project_id, :integer
  end
end
