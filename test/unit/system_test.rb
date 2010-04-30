require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  context "A System (game system)" do
    should_have_db_columns :name
    should_validate_presence_of :name
    should_have_many :campaigns
  end
end
