require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  context "A LocationsController" do
    setup do
      @location   = Location.first
    end

    should_route :get, '/campaigns/1/locations', :action=>:index, :campaign_id=>1
    should_route :get, '/campaigns/1/locations.xml', :action=>:index, :format=>:xml, :campaign_id=>1
    should_route :get, '/locations/1', :action => :show, :id=>1
    should_route :get, '/locations/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/campaigns/1/locations/new', :action => :new, :campaign_id=>1
    should_route :get, '/locations/1/edit', :action => :edit, :id=>1
    should_route :post, '/campaigns/1/locations', :action => :create, :campaign_id=>1
    should_route :put, '/locations/1', :action => :update, :id => 1
    should_route :delete, '/locations/1', :action => :destroy, :id => 1

        #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :campaign_id=>@location.campaign
      end
      #should_assign_to :locations
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    # context "on GET to :index as xml" do
      # setup do
        # get :index, :format=>'xml', :campaign_id=>@location.campaign
      # end
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :characters
    # end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@location
      end
      #should_assign_to :location
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    # context "on GET to :show as xml" do
      # setup do
        # get :show, :id=>@location, :format=>'xml'
      # end
      # should_assign_to :location
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :character
    # end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :campaign_id=>@location.campaign
      end
      #should_assign_to :location
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@location
      end
      #should_assign_to :location
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :location=>{ :campaign_id=>@location.campaign.id, :name=>'Unknown', :public_description=>'Nothing' }, :campaign_id=>@location.campaign
      end
      #should_assign_to :location
      should_set_the_flash_to(/created/i)
      should_redirect_to("the location view") { location_url(assigns(:location)) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :location=>{:name=> 'Unknown'}, :id=>@location
      end
      #should_assign_to :location
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the location view") { location_url(@location) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@location
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to("the campaign view") { campaign_url(@location.campaign) }
    end

  end
end
