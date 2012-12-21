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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221175509) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "campaigns", :force => true do |t|
    t.string   "name",                                      :null => false
    t.decimal  "cost",       :precision => 10, :scale => 2
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "client_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "campaigns", ["client_id"], :name => "index_campaigns_on_client_id"
  add_index "campaigns", ["name"], :name => "index_campaigns_on_name", :unique => true

  create_table "clients", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "clients", ["email"], :name => "index_clients_on_email", :unique => true
  add_index "clients", ["reset_password_token"], :name => "index_clients_on_reset_password_token", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "body",        :null => false
    t.integer  "creation_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["creation_id"], :name => "index_comments_on_creation_id"
  add_index "comments", ["user_id", "user_type"], :name => "index_comments_on_user_id_and_user_type"

  create_table "creations", :force => true do |t|
    t.integer  "estimate_id"
    t.integer  "client_id"
    t.integer  "project_id"
    t.integer  "designer_id"
    t.string   "name"
    t.string   "stage"
    t.integer  "revision"
    t.text     "description"
    t.integer  "hours"
    t.string   "status"
    t.string   "color_space"
    t.integer  "bleed"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "creations", ["client_id"], :name => "index_creations_on_client_id"
  add_index "creations", ["designer_id"], :name => "index_creations_on_designer_id"
  add_index "creations", ["estimate_id"], :name => "index_creations_on_estimate_id"
  add_index "creations", ["project_id"], :name => "index_creations_on_project_id"

  create_table "designers", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "designers", ["email"], :name => "index_designers_on_email", :unique => true
  add_index "designers", ["reset_password_token"], :name => "index_designers_on_reset_password_token", :unique => true

  create_table "estimates", :force => true do |t|
    t.integer  "hours"
    t.decimal  "rate",       :precision => 10, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "plans", ["name"], :name => "index_plans_on_name", :unique => true

  create_table "project_assignments", :force => true do |t|
    t.integer  "designer_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_assignments", ["designer_id"], :name => "index_project_assignments_on_designer_id"
  add_index "project_assignments", ["project_id"], :name => "index_project_assignments_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "campaign_id"
    t.integer  "client_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["campaign_id"], :name => "index_projects_on_campaign_id"
  add_index "projects", ["client_id"], :name => "index_projects_on_client_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subscriptions", ["client_id"], :name => "index_subscriptions_on_client_id"
  add_index "subscriptions", ["plan_id"], :name => "index_subscriptions_on_plan_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
