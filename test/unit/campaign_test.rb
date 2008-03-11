require File.dirname(__FILE__) + '/../test_helper'

class CampaignTest < ActiveSupport::TestCase
  should_require_attributes :name, :user_id, :system_id, :public
end
