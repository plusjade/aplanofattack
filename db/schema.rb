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

ActiveRecord::Schema.define(:version => 20100715115911) do

  create_table "pages", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_sig_page_id"
    t.text     "css"
    t.boolean  "publish",        :default => false
    t.string   "preview_key",                       :null => false
  end

  add_index "pages", ["fb_sig_page_id"], :name => "index_pages_on_fb_sig_page_id", :unique => true
  add_index "pages", ["preview_key"], :name => "index_pages_on_preview_key", :unique => true

  create_table "sliders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.string   "name"
    t.integer  "slide_count", :default => 0,   :null => false
    t.integer  "height",      :default => 400, :null => false
    t.integer  "width",       :default => 650, :null => false
    t.text     "slides",                       :null => false
    t.text     "css",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
