require 'rails_helper'

describe CampaignInvitesController, type: :controller do
  let(:campaign) { FactoryGirl.create(:campaign) }

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  context 'on GET to :new' do
    before do
      get :new, campaign_id: campaign.id
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:invite)).to_not be_nil }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:new) }
  end

  context 'on POST to :create' do
    before do
      post :create, campaign_id: campaign.id,
                    campaign_invite: {
                      email: Faker::Internet.email
                    }
    end
    it { expect(assigns(:invite)).to_not be_nil }
    it { expect(subject).to set_flash.to('Invitation sent.') }
    it { should redirect_to(campaign_path(assigns(:invite).campaign)) }
  end
end
