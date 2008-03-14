require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  should_require_attributes :email, :password_hash
  should_require_unique_attributes :email
  should_protect_attributes :password_hash
  should_have_many :campaigns
  should_have_and_belong_to_many :games
  
  def test_associations
    assert_working_associations
  end
  
  def test_authenticate
    assert_equal users(:rjordan), User.authenticate('rjordan@pobox.com', 'password')
  end
  
end
