require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  should have_db_column :name 
  should have_db_column :user_id 
  should have_db_column :system_id 
  should have_db_column :max_players 
  should have_db_column :public 
  should have_db_column :created_at 
  should have_db_column :updated_at 
  should have_db_column :version
  should validate_presence_of :name 
  should validate_presence_of :user_id 
  should validate_presence_of :system_id 
  should validate_presence_of :max_players
  should belong_to :user
  should belong_to :system
  should have_one(:private_forum).dependent(:destroy)
  should have_one(:public_forum).dependent(:destroy)
  should have_many :stories
  should have_many :players
  should have_many :player_characters
  should have_many :nonplayer_characters
  should validate_numericality_of :max_players
  should have_many :resources
end
