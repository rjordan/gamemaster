require 'rails_helper'

describe CampaignResourcesController, type: :controller do
  # context "A CampaignResourcesController" do
  #   setup do
  #     sign_in users(:rjordan)
  #     @resource = CampaignResource.first
  #   end
  #
  #   #INDEX TESTS
  #   context "on GET to :index" do
  #     setup do
  #       get :index, :campaign_id => @resource.campaign
  #     end
  #     should respond_with :success
  #     should_not set_flash
  #     #should_assign_to 'resources'
  #     should render_template :index
  #   end
  #
  #   #SHOW TESTS
  #   context "on GET to :show" do
  #     setup do
  #       get :show, :id => @resource
  #     end
  #     #should_assign_to :resource
  #     should_not set_flash
  #     should render_template :show
  #     should respond_with :success
  #   end
  #
  #   #NEW TESTS
  #   context "on GET to :new" do
  #     setup do
  #       get :new, :campaign_id => @resource.campaign
  #     end
  #     #should_assign_to :resource
  #     should_not set_flash
  #     should render_template :new
  #     should respond_with :success
  #   end
  #
  #   #EDIT TESTS
  #   context "on GET to :edit" do
  #     setup do
  #       get :edit, :id => @resource
  #     end
  #     #should_assign_to :resource
  #     should_not set_flash
  #     should render_template :edit
  #     should respond_with :success
  #   end
  #
  #   #CREATE TESTS
  #   context "on POST to :create" do
  #     setup do
  #       post :create, :campaign_resource => { :campaign_id => @resource.campaign.id,
  #                                             :resource_type => 'Character',
  #                                             :name => 'Unknown',
  #                                             :public_description => 'Nothing' },
  #            :campaign_id => @resource.campaign.id
  #     end
  #     #should_assign_to :resource
  #     should set_flash.to(/created/i)
  #     should redirect_to("the resource view") { campaign_resource_path(assigns(:resource)) }
  #   end
  #
  #   #UPDATE TESTS
  #   context "on PUT to :update" do
  #     setup do
  #       put :update, :campaign_resource => { :name => 'Unknown' }, :id => @resource
  #     end
  #     #should_assign_to :location
  #     should set_flash.to(/updated/i)
  #     should redirect_to("the resource view") { campaign_resource_path(@resource) }
  #   end
  #
  #   #DELETE tests
  #   context "on DELETE to :destroy" do
  #     setup do
  #       delete :destroy, :id => @resource
  #     end
  #     should set_flash.to(/successfully destroyed/i)
  #     should redirect_to("the campaign view") { campaign_path(@resource.campaign) }
  #   end

  # end
end
