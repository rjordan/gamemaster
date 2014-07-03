require 'spec_helper'

describe Api::V1::ProfilesController, type: :controller do
  before do
    @full_schema = {
        type: 'object',
        required: [:id, :nickname],
        properties: {
            id: { type: :string },
            nickname: { type: :string },
            campaigns: { type: :array }
        }
    }
  end

  describe 'show' do
    before do
      @profile = create(:user)
      get "/api/v1/profiles/#{@profile.id}", nil, { Accept: 'application/json' }
    end
    it { expect_valid_json_document(@full_schema) }
  end
end
