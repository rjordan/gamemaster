require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end

  it "should require attributes [email, password_hash]" do
    @user.should_not be_valid
    @user.should have(2).errors
    @user.should have(1).error_on(:email)
    @user.should have(1).error_on(:password_hash)
  end
  
  it "should allow a new user" do
    @user.email = "bob@nowhere.org"
    @user.password_hash = "password"
    @user.should be_valid
    @user.save.should be_true
    @user.errors.should be_empty
  end
end

describe User, "with fixtures" do
  fixtures :users, :campaigns
  
  it "should have a non-empty collection of users" do
    User.find(:all).should_not be_empty
  end
  
  it "should find an existing user" do
    user = User.find(users(:rjordan).id)
    user.should eql(users(:rjordan))
  end
  
  it "should authenticate a user" do
    user = User.authenticate('rjordan@pobox.com', 'password')
    user.should eql(users(:rjordan))
  end
  
   it "should have a non-empty collection of campaigns" do
    User.find(users(:rjordan)).campaigns.should_not be_empty
  end
  
end