require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  
    def setup
    end
  
  context "A UsersController" do
    setup do
      @user   = User.find(:first)
    end
      
    should_route :get, '/users', :action=>:index
    should_route :get, '/users.xml', :action=>:index, :format=>:xml
    should_route :get, '/users/1', :action => :show, :id=>1
    should_route :get, '/users/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/users/new', :action => :new
    should_route :get, '/users/1/edit', :action => :edit, :id=>1
    should_route :post, '/users', :action => :create
    should_route :put, '/users/1', :action => :update, :id => 1
    should_route :delete, '/users/1', :action => :destroy, :id => 1

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index
      end
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    context "on GET to :index as xml" do
      setup do
        get :index, :format=>'xml'
      end
      should_respond_with_content_type 'application/xml'
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      should_respond_with_xml_for :users
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@user
      end
      should_assign_to :user
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    context "on GET to :show as xml" do
      setup do
        get :show, :id=>@user, :format=>'xml'
      end
      should_assign_to :user
      should_respond_with_content_type 'application/xml'
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      should_respond_with_xml_for :user
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new
      end
      should_assign_to :user
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
      should_render_a_form
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@user
      end
      should_assign_to :user
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
      should_render_a_form
    end

    #CREATE TESTS
    #This won't work due to protected attribute
    context "on POST to :create" do
      setup do
        post :create, :user=>{:nickname=>'Unknown', :email=>'blah@nowhere.com',
          :password=>'password', :password_confirmation=>'password' }
      end
      should_assign_to :user
      should_set_the_flash_to(/created/i)
      should_redirect_to "user_path(@user)"
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :user=>{:nickname=> 'Unknown'}, :id=>@user
      end
      should_assign_to :user
      should_set_the_flash_to(/updated/i)
      should_redirect_to "user_url(@user)"
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@user
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to "users_url"
    end

  end
end 