require 'spec_helper'

describe Api::V1::ProfilesController, type: :controller do
  describe 'show' do
    before do
      @profile = create(:user)
      get :show, id: @profile, format: :json
    end
    it { expect(response.status).to eq(200) }
    it { expect(response.content_type).to eq('application/json') }
  end
end
