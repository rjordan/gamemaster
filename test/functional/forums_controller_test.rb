require File.dirname(__FILE__) + '/../test_helper'

class ForumsControllerTest < ActionController::TestCase
  
  def setup
  end
  
  context "A ForumsController" do
    setup do
      @forum = Forum.find(:first)
    end

#      should_be_restful do |resource|
#        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
#        resource.formats    = [:html, :xml]
#        resource.create.params = { :name=>'A General Forum'  }
#        resource.update.params = { :name=>'A General Forum'  }
#      end

    should_route :get, '/forums', :action=>:index
    should_route :get, '/forums.xml', :action=>:index, :format=>:xml
    should_route :get, '/forums/1', :action => :show, :id=>1
    should_route :get, '/forums/1.xml', :action => :show, :id=>1, :format=>:xml
    #should_route :get, '/forums/new', :action => :new
    should_route :get, '/forums/1/edit', :action => :edit, :id=>1
    should_route :post, '/forums', :action => :create
    should_route :put, '/forums/1', :action => :update, :id => 1
    should_route :delete, '/forums/1', :action => :destroy, :id => 1

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
      should_respond_with_content_type :xml
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      #should_respond_with_xml_for :forums
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@forum
      end
      should_assign_to :forum
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    context "on GET to :show as xml" do
      setup do
        get :show, :id=>@forum, :format=>'xml'
      end
      should_assign_to :forum
      should_respond_with_content_type :xml
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      #should_respond_with_xml_for :forum
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new
      end
      should_assign_to :forum
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
      should_render_a_form
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@forum
      end
      should_assign_to :forum
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
      should_render_a_form
    end

    #TODO Implement
    #CREATE TESTS
#    context "on POST to :create" do
#      setup do
#        post :create, :forum=>{:name=>'A General Forum'}
#      end
#      should_assign_to :forum
#      should_set_the_flash_to(/created/i)
#      should_redirect_to("the forum view") { forum_url( assigns(:forum) ) }
#    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :forum=>{:name=>'A General Forum'}, :id=>@forum
      end
      should_assign_to :forum
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the forum view") { forum_url( assigns(:forum) ) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@forum
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to("the forums list") { forums_url }
    end

  end
end 