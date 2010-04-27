require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_db_columns :email, :nickname
  should_validate_presence_of :email, :nickname
  should_validate_uniqueness_of :email, :nickname, :case_sensitive=>false
  should_have_many :campaigns
  should_have_many :games
end
