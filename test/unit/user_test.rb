require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  
  context "A User" do
    should_have_db_columns :email, :password_hash, :nickname
    should_validate_presence_of :email, :password_hash, :nickname
    should_validate_uniqueness_of :email, :nickname
    should_not_allow_mass_assignment_of :password_hash
    should_have_many :campaigns
    should_have_many :games
    #should_validate_confirmation_of :password
    should_ensure_length_at_least :password, 8
  
    should "authenticate a valid user" do
      assert_equal users(:rjordan), User.authenticate('rjordan@pobox.com', 'password')
    end

    should "not authenticate a user with a bad password" do
      assert_equal nil, User.authenticate('rjordan@pobox.com', 'badpass')
    end
  end
  
end
