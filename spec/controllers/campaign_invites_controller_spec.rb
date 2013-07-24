require 'spec_helper'

describe CampaignInvitesController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
    @campaign = create(:campaign)
  end

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
end
