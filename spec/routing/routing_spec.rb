require 'spec_helper'

describe 'Application routing' do

  it 'handles the root route' do
    expect(get: '/').to route_to('campaigns#index')
  end

  context 'profile routes' do
    it 'handles the show route' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end
  end

  context 'campaign routes' do
    it 'handles the index route' do
      expect(get: '/campaigns').to route_to('campaigns#index')
    end
    it 'handles the show route' do
      expect(get: '/campaigns/1').to route_to('campaigns#show', id: '1')
    end
    it 'handles the new route' do
      expect(get: '/campaigns/new').to route_to('campaigns#new')
    end
    it 'handles the create route' do
      expect(post: '/campaigns').to route_to('campaigns#create')
    end
    it 'handles the edit route' do
      expect(get: '/campaigns/1/edit').to route_to('campaigns#edit', id: '1')
    end
    it 'handles the update route' do
      expect(put: '/campaigns/1').to route_to('campaigns#update', id: '1')
    end
#    should route(:delete, '/campaigns/1').to(:action => :destroy, :id => 1)
  end
end

