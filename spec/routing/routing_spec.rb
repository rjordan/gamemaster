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

  # context 'chapter routes' do
  #   it 'handles the index route' do
  #     expect(get: '/stories/1/chapters').to route_to('stories#index', :story_id => '1')
  #   end
  #   # should route(:get, '/stories/1/chapters.xml').to(:action => :index, :story_id => 1, :format => :xml)
  #   # should route(:get, '/chapters/1').to(:action => :show, :id => 1)
  #   # should route(:get, '/chapters/1.xml').to(:action => :show, :id => 1, :format => :xml)
  #   # should route(:get, '/stories/1/chapters/new').to(:action => :new, :story_id => 1)
  #   # should route(:get, '/chapters/1/edit').to(:action => :edit, :id => 1)
  #   # should route(:post, '/stories/1/chapters').to(:action => :create, :story_id => 1)
  #   # should route(:put, '/chapters/1').to(:action => :update, :id => 1)
  #   # should route(:delete, '/chapters/1').to(:action => :destroy, :id => 1)
  # end

#   should route(:get, '/campaigns/1/stories').to(:action => :index, :campaign_id => 1)
#   should route(:get, '/campaigns/1/stories.xml').to(:action => :index, :campaign_id => 1, :format => :xml)
#   should route(:get, '/stories/1').to(:action => :show, :id => 1)
#   should route(:get, '/stories/1.xml').to(:action => :show, :id => 1, :format => :xml)
#   should route(:get, '/campaigns/1/stories/new').to(:action => :new, :campaign_id => 1)
#   should route(:get, '/stories/1/edit').to(:action => :edit, :id => 1)
#   should route(:post, '/campaigns/1/stories').to(:action => :create, :campaign_id => 1)
#   should route(:put, '/stories/1').to(:action => :update, :id => 1)
#   should route(:delete, '/stories/1').to(:action => :destroy, :id => 1)
#
#   should route(:get, '/forums/1/posts').to(:action => :index, :forum_id => 1)
#   should route(:get, '/forums/1/posts.xml').to(:action => :index, :forum_id => 1, :format => :xml)
#   should route(:get, '/posts/1').to(:action => :show, :id => 1)
#   should route(:get, '/posts/1.xml').to(:action => :show, :id => 1, :format => :xml)
#   should route(:get, '/forums/1/posts/new').to(:action => :new, :forum_id => 1)
#   should route(:get, '/posts/1/edit').to(:action => :edit, :id => 1)
#   should route(:post, '/forums/1/posts').to(:action => :create, :forum_id => 1)
#   should route(:put, '/posts/1').to(:action => :update, :id => 1)
#   should route(:delete, '/posts/1').to(:action => :destroy, :id => 1)
#
#   should route(:get, '/forums').to(:action => :index)
#   should route(:get, '/forums.xml').to(:action => :index, :format => :xml)
#   should route(:get, '/forums/1').to(:action => :show, :id => 1)
#   should route(:get, '/forums/1.xml').to(:action => :show, :id => 1, :format => :xml)
# #should route(:get, '/forums/new').to(:action => :new)
#   should route(:get, '/forums/1/edit').to(:action => :edit, :id => 1)
#   should route(:post, '/forums').to(:action => :create)
#   should route(:put, '/forums/1').to(:action => :update, :id => 1)
#   should route(:delete, '/forums/1').to(:action => :destroy, :id => 1)
#
#
#   should route(:get, '/campaigns/1/characters').to(:action => :index, :campaign_id => 1)
#   should route(:get, '/campaigns/1/characters.xml').to(:action => :index, :format => :xml, :campaign_id => 1)
#   should route(:get, '/characters/1').to(:action => :show, :id => 1)
#   should route(:get, '/characters/1.xml').to(:action => :show, :id => 1, :format => :xml)
#   should route(:get, '/campaigns/1/characters/new').to(:action => :new, :campaign_id => 1)
#   should route(:get, '/characters/1/edit').to(:action => :edit, :id => 1)
#   should route(:post, '/campaigns/1/characters').to(:action => :create, :campaign_id => 1)
#   should route(:put, '/characters/1').to(:action => :update, :id => 1)
#   should route(:delete, '/characters/1').to(:action => :destroy, :id => 1)
end

