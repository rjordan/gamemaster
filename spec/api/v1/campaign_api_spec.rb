require 'spec_helper'

describe Api::V1::CampaignsController, type: :controller do
  before do
    @full_schema = {
        type: 'object',
        required: [:id, :name, :max_players, :description, :public, :owner, :system],
        properties: {
            id: { type: :string },
            name: { type: :string },
            max_players: { type: :integer },
            description: { type: :string },
            public: { type: :boolean },
            owner: { type: :integer },
            system: { type: :string }
        }
    }
  end

  describe 'index' do
    before do
      @public_campaign = create(:campaign, public: true)
      @nonpublic_campaign = create(:campaign, public: false)
      get '/api/v1/campaigns', nil, { Accept: 'application/json' }
    end
    it { expect_valid_json_list(@full_schema) }
  end

  describe 'show' do
    before do
      @campaign = create(:campaign)
      get "/api/v1/campaigns/#{@campaign.id}", nil, { Accept: 'application/json' }
    end
    it { expect_valid_json_document(@full_schema) }
  end
end

