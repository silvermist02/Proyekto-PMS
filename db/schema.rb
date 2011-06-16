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

ActiveRecord::Schema.define(:version => 20110614072338) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["ticket_id"], :name => "index_comments_on_ticket_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["status"], :name => "index_projects_on_status"
  add_index "projects", ["tag_id"], :name => "index_projects_on_tag_id"

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], :name => "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id"], :name => "index_projects_users_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "member_add"
    t.boolean  "member_remove"
    t.boolean  "project_create"
    t.boolean  "project_read"
    t.boolean  "project_update"
    t.boolean  "project_delete"
    t.boolean  "ticket_create"
    t.boolean  "ticket_read"
    t.boolean  "ticket_update"
    t.boolean  "ticket_delete"
    t.boolean  "ticket_assign"
    t.boolean  "ticket_comment"
    t.boolean  "tag_create"
    t.boolean  "tag_read"
    t.boolean  "tag_update"
    t.boolean  "tag_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.string   "priority"
    t.integer  "assigned_to"
    t.time     "logged_time"
    t.integer  "created_by"
    t.string   "tracker"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["assigned_to"], :name => "index_tickets_on_assigned_to"
  add_index "tickets", ["created_at"], :name => "index_tickets_on_created_at"
  add_index "tickets", ["name"], :name => "index_tickets_on_name"
  add_index "tickets", ["priority"], :name => "index_tickets_on_priority"
  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
  add_index "tickets", ["status"], :name => "index_tickets_on_status"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "user_name"
    t.integer  "role_id"
    t.date     "birthdate"
    t.string   "status"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
