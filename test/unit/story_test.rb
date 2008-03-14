require File.dirname(__FILE__) + '/../test_helper'

class StoryTest < ActiveSupport::TestCase
  should_require_attributes :name, :campaign_id, :public_description
  should_belong_to :campaign
end
