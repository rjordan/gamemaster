require 'spec_helper'

describe Api::CampaignsController do
  describe 'index' do
    before do
      get '/api/campaigns', nil, { Accept: 'application/json' }
    end   
    it { expect(response.status).to eq(200) }
    it { expect(response.content_type).to eq('application/json') }
  end
end

