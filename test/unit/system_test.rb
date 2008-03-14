require File.dirname(__FILE__) + '/../test_helper'

class SystemTest < ActiveSupport::TestCase
  context "A System (game system)" do
    should_require_attributes :name
    should_have_many :campaigns
  end
end
