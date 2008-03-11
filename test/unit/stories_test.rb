require File.dirname(__FILE__) + '/../test_helper'

class StoriesTest < ActiveSupport::TestCase
  should_require_attributes :name, :campaign_id, :public_description, :public
end
