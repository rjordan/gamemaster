require File.dirname(__FILE__) + '/../test_helper'

class CampaignsControllerTest < ActionController::TestCase
  
  def setup
  end
  
  context "A CampaignsController" do
    setup do
      @campaign   = Campaign.first
      session[:user_id] = User.first.id
    end

    should_route :get, '/campaigns', :action => :index
    should_route :get, '/campaigns.xml', :action => :index, :format=>:xml
    should_route :get, '/campaigns/1', :action => :show, :id=>1
    should_route :get, '/campaigns/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/campaigns/new', :action => :new
    should_route :get, '/campaigns/1/edit', :action => :edit, :id=>1
    should_route :post, '/campaigns', :action => :create
    should_route :put, '/campaigns/1', :action => :update, :id => "1"
    should_route :delete, '/campaigns/1', :action => :destroy, :id => 1

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
      should_respond_with_xml_for :campaigns
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@campaign
      end
      should_assign_to :campaign
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    context "on GET to :show as xml" do
      setup do
        get :show, :id=>@campaign, :format=>'xml'
      end
      should_assign_to :campaign
      should_respond_with_content_type 'application/xml'
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      should_respond_with_xml_for :campaign
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new
      end
      should_assign_to :campaign
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
      should_render_a_form
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@campaign
      end
      should_assign_to :campaign
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
      should_render_a_form
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :campaign=>{:name=>'Unknown', :max_players=>5, :system_id=>1}
      end
      should_assign_to :campaign
      should_set_the_flash_to(/created/i)
      should_redirect_to "campaign_url(@campaign)"
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :campaign=>{:name=>'Unknown'}, :id=>@campaign
      end
      should_assign_to :campaign
      should_set_the_flash_to(/updated/i)
      should_redirect_to "campaign_url(@campaign)"
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@campaign
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to "campaigns_url"
    end

end
end 