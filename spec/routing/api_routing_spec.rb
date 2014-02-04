require 'spec_helper'

describe Api do
  describe 'campaign' do
    it 'handles the index route' do
      expect(get: '/api/campaigns').to route_to('api/campaigns#index', format: 'json')
    end
    it 'handles the show route' do
      expect(get: '/api/campaigns/1').to route_to('api/campaigns#show', id: '1', format: 'json')
    end
    it 'handles the create route' do
      expect(post: '/api/campaigns').to route_to('api/campaigns#create', format: 'json')
    end
    it 'handles the update route' do
      expect(put: '/api/campaigns/1').to route_to('api/campaigns#update', id: '1', format: 'json')
    end
    it 'handles the delete route' do
      expect(delete: '/api/campaigns/1').to route_to('api/campaigns#destroy', id: '1', format: 'json')
    end
  end
end

