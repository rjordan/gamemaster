require 'spec_helper'

describe Api::V1 do
  describe 'campaigns', type: :routing do
    it 'handles the index route' do
      expect(get: '/api/v1/campaigns').to route_to('api/v1/campaigns#index', format: 'json')
    end
    it 'handles the show route' do
      expect(get: '/api/v1/campaigns/1').to route_to('api/v1/campaigns#show', id: '1', format: 'json')
    end
    # it 'handles the create route' do
    #   expect(post: '/api/v1/campaigns').to route_to('api/campaigns#create', format: 'json')
    # end
    # it 'handles the update route' do
    #   expect(put: '/api/v1/campaigns/1').to route_to('api/campaigns#update', id: '1', format: 'json')
    # end
    # it 'handles the delete route' do
    #   expect(delete: '/api/v1/campaigns/1').to route_to('api/campaigns#destroy', id: '1', format: 'json')
    # end
  end

  describe 'profiles', type: :routing do
    it 'handles the show route' do
      expect(get: '/api/v1/profiles/1').to route_to('api/v1/profiles#show', id: '1', format: 'json')
    end
  end
end

