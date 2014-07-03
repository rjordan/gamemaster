require 'spec_helper'

describe Api::V1::CampaignsController, type: :controller do
  describe 'index' do
    before do
      @public_campaign = create(:campaign, public: true)
      @nonpublic_campaign = create(:campaign, public: false)
      get :index, format: :json
    end
    it { expect(response.status).to eq(200) }
    it { expect(response.content_type).to eq('application/json') }
    it { expect(assigns(:campaigns)).to include(@public_campaign) }
    it { expect(assigns(:campaigns)).to_not include(@nonpublic_campaign) }
  end

  describe 'show' do
    before do
      @campaign = create(:campaign)
      get :show, id: @campaign, format: :json
    end
    it { expect(response.status).to eq(200) }
    it { expect(response.content_type).to eq('application/json') }
  end
end

