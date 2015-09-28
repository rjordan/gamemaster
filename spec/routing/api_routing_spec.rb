require 'rails_helper'

describe Api::V1 do
  describe 'campaigns', type: :routing do
    it 'handles the index route' do
      expect(get: '/api/v1/campaigns').to route_to('api/v1/campaigns#index', format: 'json')
    end
    it 'handles the show route' do
      expect(get: '/api/v1/campaigns/1').to route_to('api/v1/campaigns#show', id: '1', format: 'json')
    end
  end

  describe 'profiles', type: :routing do
    it 'handles the show route' do
      expect(get: '/api/v1/profiles/1').to route_to('api/v1/profiles#show', id: '1', format: 'json')
    end
  end
end
