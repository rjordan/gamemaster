require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  
  context "A User" do
    should_have_db_columns :email, :password_hash, :nickname
    should_require_attributes :email, :password_hash, :nickname
    should_require_unique_attributes :email, :nickname
    should_protect_attributes :password_hash
    should_have_many :campaigns
    should_have_and_belong_to_many :games
  
    should "authenticate a valid user" do
      assert_equal users(:rjordan), User.authenticate('rjordan@pobox.com', 'password')
    end

    should "not authenticate a user with a bad password" do
      assert_equal nil, User.authenticate('rjordan@pobox.com', 'badpass')
    end
  end
  
end
