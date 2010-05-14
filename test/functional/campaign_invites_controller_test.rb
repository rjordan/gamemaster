require 'test_helper'

class CampaignInvitesControllerTest < ActionController::TestCase

  context "A CampaignInvitesController" do
    setup do
      sign_in users(:rjordan)
      @invite = CampaignInvite.first
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
      setup do
        get :new, :campaign_id=>@invite.campaign
      end
      #should_assign_to :invite
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :campaign_invite=>{ :campaign_id=>@invite.campaign.id, 
                                          :email=>'bob3@nowhere.com' }, 
                                          :campaign_id=>@invite.campaign.id
      end
      #should_assign_to :invite
      should_set_the_flash_to(/created/i)
      should_redirect_to("the campaign view") { campaign_path(assigns(:invite)) }
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
end
