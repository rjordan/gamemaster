require 'spec_helper'

describe CampaignInvitesController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
    @campaign = create(:campaign)
  end

    #INDEX TESTS
 #   context "on GET to :index" do
 #     setup do
 #       get :index, :campaign_id=>@resource.campaign
 #     end
 #     should_respond_with :success
 #     should_not_set_the_flash
 #     #should_assign_to 'resources'
 #     should_render_template :index
 #   end

    #NEW TESTS
    context "on GET to :new" do
      before do
        get :new, :campaign_id=>@campaign.id
      end
      it { assigns(:invite).should_not be_nil }
      #it { should_not set_the_flash }
      it { should render_template :new }
      it { should respond_with :success }
    end

    #CREATE TESTS
    context "on POST to :create" do
      before do
        post :create, campaign_id: @campaign.id, 
                      campaign_invite: { 
                        email: Faker::Internet.email 
                      } 
      end
      it { assigns(:invite).should_not be_nil }
      #it { should set_the_flash.to(/created/i) }
      it { should redirect_to(campaign_path(assigns(:invite).campaign)) }
    end

    #DELETE tests
#    context "on DELETE to :destroy" do
#      setup do
#        delete :destroy, :id=>@resource
#      end
#      should_set_the_flash_to(/successfully removed/i)
#      should_redirect_to("the campaign view") { campaign_path(@resource.campaign) }
#    end
end
