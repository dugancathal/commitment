class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_uid
      t.string :username
      t.string :token
      t.string :secret
      t.datetime :token_expires_at

      t.timestamps null: false
    end
  end
end
