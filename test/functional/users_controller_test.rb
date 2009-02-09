
require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < Test::Unit::TestCase
  
    def setup
      @controller = UsersController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
      @user   = User.find(:first)
    end
  
  context "A UsersController" do
    setup do
    end
      
    should_be_restful do |resource|
      resource.actions    = [:index, :show, :new, :edit, :update, :destroy] #create
      resource.formats    = [:html, :xml]
      resource.create.params = { :nickname=>'Unknown', :email=>'blah@nowhere.com' }
      resource.create.params[:password_hash]='password'
      resource.update.params = { :nickname=> 'Unknown' }
    end 


  end
end 