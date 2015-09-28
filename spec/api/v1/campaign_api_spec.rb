require 'rails_helper'

describe Api::V1::CampaignsController, type: :controller do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  let(:campaign) { FactoryGirl.create(:campaign, public: true) }

  describe 'index' do
    before do
      xhr :get, :index
    end
    it { expect(response.status).to eq(200) }
  end

  describe 'show' do
    before do
      xhr :get, :show, id: campaign.id
    end
    it { expect(response.status).to eq(200) }
  end
end
