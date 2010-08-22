require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  should have_db_column :name
  should validate_presence_of :name
  should have_many :campaigns
end
