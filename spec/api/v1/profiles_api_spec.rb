require 'rails_helper'

describe Api::V1::ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe 'show' do
    before do
      xhr :get, :show, id: user.id
    end
    it { expect(response.status).to eq(200) }
  end
end
