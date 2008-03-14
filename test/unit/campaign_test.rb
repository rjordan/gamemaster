require File.dirname(__FILE__) + '/../test_helper'

class CampaignTest < ActiveSupport::TestCase
  context "A Campaign" do
    should_require_attributes :name, :user_id, :system_id, :max_players
    should_belong_to :user
    should_belong_to :system
    should_have_many :stories
    should_have_and_belong_to_many :players
  end
end
