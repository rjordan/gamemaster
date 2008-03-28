require File.dirname(__FILE__) + '/../test_helper'

class CampaignTest < ActiveSupport::TestCase
  context "A Campaign" do
    should_have_db_columns :name, :user_id, :system_id, :max_players, :public, :created_at, :updated_at, :version
    should_require_attributes :name, :user_id, :system_id, :max_players
    should_belong_to :user
    should_belong_to :system
    should_have_many :stories
    should_have_many :players
    should_only_allow_numeric_values_for :max_players
  end
end
