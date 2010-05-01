require 'test_helper'

class CampaignResourcesControllerTest < ActionController::TestCase

  context "A CampaignResourcesController" do
    setup do
      sign_in users(:rjordan)
      @resource = CampaignResource.first
    end

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :campaign_id=>@resource.campaign
      end
      should_respond_with :success
      should_not_set_the_flash
      #should_assign_to 'resources'
      should_render_template :index
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@resource
      end
      #should_assign_to :resource
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :campaign_id=>@resource.campaign
      end
      #should_assign_to :resource
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@resource
      end
      #should_assign_to :resource
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :campaign_resource=>{ :campaign_id=>@resource.campaign.id, 
                                            :resource_type=>'Character', 
                                            :name=>'Unknown', 
                                            :public_description=>'Nothing' }, 
                                            :campaign_id=>@resource.campaign.id
      end
      #should_assign_to :resource
      should_set_the_flash_to(/created/i)
      should_redirect_to("the resource view") { campaign_resource_path(assigns(:resource)) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :campaign_resource=>{:name=> 'Unknown'}, :id=>@resource
      end
      #should_assign_to :location
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the resource view") { campaign_resource_path(@resource) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@resource
      end
      should_set_the_flash_to(/successfully removed/i)
      should_redirect_to("the campaign view") { campaign_path(@resource.campaign) }
    end

  end
end
