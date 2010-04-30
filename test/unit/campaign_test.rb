require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  context "A Campaign" do
    should_have_db_columns :name, :user_id, :system_id, :max_players, :public, :created_at, :updated_at, :version
    should_validate_presence_of :name, :user_id, :system_id, :max_players
    should_belong_to :user
    should_belong_to :system
    should_have_one :private_forum, :dependent=>:destroy
    should_have_one :public_forum, :dependent=>:destroy
    should_have_many :stories
    should_have_many :players
    should_have_many :player_characters
    should_have_many :nonplayer_characters
    should_validate_numericality_of :max_players
    should_have_many :resources
  end
end
