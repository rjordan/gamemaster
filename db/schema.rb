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

ActiveRecord::Schema.define(version: 20_100_514_041_845) do
  create_table 'campaign_invites', force: true do |t|
    t.integer 'campaign_id', null: false
    t.string 'email', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'campaign_invites', ['campaign_id'], name: 'index_campaign_invites_on_campaign_id'

  create_table 'campaign_resources', force: true do |t|
    t.string 'name', null: false
    t.integer 'campaign_id', null: false
    t.integer 'parent_id'
    t.string 'resource_type', null: false
    t.boolean 'public', default: false, null: false
    t.text 'public_description', null: false
    t.text 'private_description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'campaign_resources', ['campaign_id'], name: 'index_campaign_resources_on_campaign_id'

  create_table 'campaigns', force: true do |t|
    t.string 'name', null: false
    t.integer 'user_id', null: false
    t.integer 'system_id', null: false
    t.boolean 'public', default: false, null: false
    t.text 'description', null: false
    t.integer 'max_players', default: 5, null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'campaigns', ['public'], name: 'index_campaigns_on_public'
  add_index 'campaigns', ['system_id'], name: 'index_campaigns_on_system_id'
  add_index 'campaigns', ['user_id'], name: 'index_campaigns_on_user_id'

  create_table 'campaigns_invitations', id: false, force: true do |t|
    t.integer 'campaign_id', null: false
    t.string 'email', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'campaigns_invitations', %w(campaign_id email), name: 'index_campaigns_invitations_on_campaign_id_and_email', unique: true

  create_table 'campaigns_players', id: false, force: true do |t|
    t.integer 'campaign_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'start_date'
    t.datetime 'end_date'
  end

  add_index 'campaigns_players', %w(campaign_id user_id), name: 'index_campaigns_players_on_campaign_id_and_user_id', unique: true

  create_table 'chapters', force: true do |t|
    t.string 'name', null: false
    t.integer 'story_id', null: false
    t.integer 'position', default: 1
    t.boolean 'revealed', default: false, null: false
    t.text 'public_description', null: false
    t.text 'private_description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'chapters', ['story_id'], name: 'index_chapters_on_story_id'

  create_table 'characters', force: true do |t|
    t.string 'name', null: false
    t.integer 'campaign_id', null: false
    t.integer 'user_id'
    t.text 'public_description', null: false
    t.text 'statistics', null: false
    t.text 'private_description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'characters', ['campaign_id'], name: 'index_characters_on_campaign_id'
  add_index 'characters', ['user_id'], name: 'index_characters_on_user_id'

  create_table 'forum_users', force: true do |t|
    t.integer 'forum_id', null: false
    t.integer 'user_id', null: false
    t.boolean 'moderator', default: false, null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'forum_users', %w(forum_id user_id), name: 'index_forum_users_on_forum_id_and_user_id', unique: true

  create_table 'forums', force: true do |t|
    t.string 'name', null: false
    t.integer 'campaign_id'
    t.boolean 'public', default: true, null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'forums', ['campaign_id'], name: 'index_forums_on_campaign_id'

  create_table 'posts', force: true do |t|
    t.integer 'forum_id', null: false
    t.string 'title', null: false
    t.integer 'user_id', null: false
    t.text 'contents', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'posts', ['forum_id'], name: 'index_posts_on_forum_id'
  add_index 'posts', ['user_id'], name: 'index_posts_on_user_id'

  create_table 'stories', force: true do |t|
    t.string 'name', null: false
    t.integer 'campaign_id', null: false
    t.boolean 'revealed', default: false, null: false
    t.text 'public_description', null: false
    t.text 'private_description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'version', default: 1, null: false
  end

  add_index 'stories', ['campaign_id'], name: 'index_stories_on_campaign_id'

  create_table 'systems', force: true do |t|
    t.string 'name', null: false
  end

  create_table 'users', force: true do |t|
    t.string 'nickname', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.datetime 'locked_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
end
