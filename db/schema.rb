# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091129200317) do

  create_table "campaigns", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "system_id",                      :null => false
    t.boolean  "public",      :default => false, :null => false
    t.integer  "max_players", :default => 5,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",     :default => 1,     :null => false
  end

  create_table "campaigns_invitations", :id => false, :force => true do |t|
    t.integer "campaign_id", :null => false
    t.string  "email",       :null => false
  end

  add_index "campaigns_invitations", ["campaign_id", "email"], :name => "index_campaigns_invitations_on_campaign_id_and_email", :unique => true

  create_table "campaigns_players", :id => false, :force => true do |t|
    t.integer "campaign_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "campaigns_players", ["campaign_id", "user_id"], :name => "index_campaigns_players_on_campaign_id_and_user_id", :unique => true

  create_table "chapters", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "story_id",                               :null => false
    t.integer  "position",            :default => 1,     :null => false
    t.text     "public_description",                     :null => false
    t.text     "private_description"
    t.boolean  "public",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",             :default => 1,     :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "campaign_id",                        :null => false
    t.integer  "user_id"
    t.text     "public_description",                 :null => false
    t.text     "statistics",                         :null => false
    t.text     "private_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",             :default => 1, :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "campaign_id"
    t.boolean  "public",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",     :default => 1,    :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "campaign_id",                        :null => false
    t.integer  "user_id"
    t.text     "public_description",                 :null => false
    t.text     "private_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",             :default => 1, :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title",                     :null => false
    t.integer  "forum_id",                  :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :default => 1, :null => false
    t.text     "contents",                  :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "campaign_id",                            :null => false
    t.text     "public_description",                     :null => false
    t.text     "private_description"
    t.boolean  "public",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",             :default => 1,     :null => false
    t.integer  "position",            :default => 1,     :null => false
  end

  create_table "systems", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nickname",                          :null => false
    t.string   "email",                             :null => false
    t.string   "password_hash",                     :null => false
    t.string   "password_salt"
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "openid_identifier"
    t.string   "persistence_token",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :default => 1, :null => false
  end

end
