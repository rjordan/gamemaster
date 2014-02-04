require 'spec_helper'

describe 'The Campaign API' do
  it 'routes to index' do
    expect(get: '/api/campaigns').to route_to('api/campaigns#index', format: 'json')
  end
end

