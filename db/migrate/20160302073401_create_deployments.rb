class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.integer :owner_id, index: true
      t.integer :repo_id, index: true
      t.string :from
      t.string :upto
      t.string :name

      t.timestamps null: false
    end
  end
end
