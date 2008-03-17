
require File.dirname(__FILE__) + '/../test_helper'

class SessionsControllerTest < Test::Unit::TestCase
  
  def setup
    @controller = SessionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  context "A SessonsController" do
    context "on GET to :new" do
      setup do
        get :new
      end

      should_respond_with :success
      should_render_template :new
      should_render_a_form
      should_not_set_the_flash

      should "be valid markup" do
        assert_valid_markup
      end

    end  
  
    context "on POST to :create" do
      context "with invalid login" do
        setup do
          post :create, {:login=>'rjordan@pobox.com', :password=>'badpass'}
        end
      
        should_respond_with :success
        should_render_template :new
        should_render_a_form
        should_set_the_flash_to "Invalid user/password combination!"
      end
      context "with valid login" do
        setup do
          post :create, {:login=>'rjordan@pobox.com', :password=>'password'}
        end

        #should_redirect_to campaigns_url
        should_set_the_flash_to "Welcome back, rjordan@pobox.com!"
      end
    end
  
    context "on DELETE to :destroy" do
      setup do
        delete :destroy
      end

      should_redirect_to "new_session_url"
      should_set_the_flash_to "You've been logged out."
    end
  end 
end 