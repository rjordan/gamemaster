require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_db_column :email 
  should have_db_column :nickname
  should validate_presence_of :email 
  should validate_presence_of :nickname
  should validate_uniqueness_of :email 
  should validate_uniqueness_of(:nickname)
  should have_many :campaigns
  should have_many :games
end
