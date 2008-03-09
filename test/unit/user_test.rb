require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  should_require_attributes :email, :password_hash
  
  def test_authenticate
    assert_equal users(:rjordan), User.authenticate('rjordan@pobox.com', 'password')
  end
end
