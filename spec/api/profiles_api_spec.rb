require 'spec_helper'

describe Api::ProfilesController do
  describe 'show' do
    before do
      @profile = create(:user)
      get "/api/profiles/#{@profile.id}", nil, { Accept: 'application/json' }
    end   
    it { expect(response.status).to eq(200) }
    it { expect(response.content_type).to eq('application/json') }
  end
end
