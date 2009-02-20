require File.dirname(__FILE__) + '/../test_helper'

class StoriesControllerTest < ActionController::TestCase
 
  def setup
  end
  
  context "A StoriesController" do
    setup do
      @story = Story.first
      session[:user_id] = User.first.id
    end

    should_route :get, '/campaigns/1/stories', :action=>:index, :campaign_id=>1
    should_route :get, '/campaigns/1/stories.xml', :action=>:index, :campaign_id=>1, :format=>:xml
    should_route :get, '/stories/1', :action => :show, :id=>1
    should_route :get, '/stories/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/campaigns/1/stories/new', :action => :new, :campaign_id=>1
    should_route :get, '/stories/1/edit', :action => :edit, :id=>1
    should_route :post, '/campaigns/1/stories', :action => :create, :campaign_id=>1
    should_route :put, '/stories/1', :action => :update, :id => 1
    should_route :delete, '/stories/1', :action => :destroy, :id => 1

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :campaign_id=>@story.campaign
      end
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    context "on GET to :index as xml" do
      setup do
        get :index, :campaign_id=>@story.campaign, :format=>'xml'
      end
      should_respond_with_content_type :xml
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      #should_respond_with_xml_for :stories
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@story, :campaign_id=>@story.campaign
      end
      should_assign_to :story
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    context "on GET to :show as xml" do
      setup do
        get :show, :id=>@story, :campaign_id=>@story.campaign, :format=>'xml'
      end
      should_assign_to :story
      should_respond_with_content_type :xml
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      #should_respond_with_xml_for :story
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :campaign_id=>@story.campaign
      end
      should_assign_to :story
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
      should_render_a_form
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@story
      end
      should_assign_to :story
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
      should_render_a_form
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :campaign_id=>@story.campaign.id, :story=>{:campaign_id=>@story.campaign.id, :name=>'Unknown', :public_description=>'Nothing'}
      end
      should_assign_to :story
      should_set_the_flash_to(/created/i)
      should_redirect_to("the story view") { story_path( assigns(:story) ) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :story=>{:name=>'Unknown'}, :id=>@story
      end
      should_assign_to :story
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the story view") { story_path( assigns(:story) ) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@story
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to("the list of stories for a campaign") { campaign_stories_path( @story.campaign ) }
    end

  end
end 