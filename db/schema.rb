# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160303181950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deployments", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "repo_id"
    t.string   "from"
    t.string   "upto"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "tracker_project_id"
  end

  add_index "deployments", ["owner_id"], name: "index_deployments_on_owner_id", using: :btree
  add_index "deployments", ["repo_id"], name: "index_deployments_on_repo_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "github_uid"
    t.string   "username"
    t.string   "token"
    t.string   "secret"
    t.datetime "token_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "tracker_token"
    t.string   "provider"
  end

end
