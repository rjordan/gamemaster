require 'rails_helper'

describe 'Application routing', type: :routing do
  it 'handles the root route' do
    expect(get: '/').to route_to('campaigns#index')
  end

  context 'profile routes' do
    it 'handles the show route' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end
    it 'handles the show route' do
      expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
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
    it 'handles the delete route' do
      expect(delete: '/campaigns/1').to route_to('campaigns#destroy', id: '1')
    end

    context 'character routes' do
      it 'handles the index route' do
        expect(get: '/campaigns/1/characters').to route_to('characters#index', campaign_id: '1')
      end
      it 'handles the show route' do
        expect(get: '/campaigns/1/characters/1').to route_to('characters#show', campaign_id: '1', id: '1')
      end
      it 'handles the new route' do
        expect(get: '/campaigns/1/characters/new').to route_to('characters#new', campaign_id: '1')
      end
      it 'handles the create route' do
        expect(post: '/campaigns/1/characters').to route_to('characters#create', campaign_id: '1')
      end
      it 'handles the edit route' do
        expect(get: '/campaigns/1/characters/1/edit').to route_to('characters#edit', id: '1', campaign_id: '1')
      end
      it 'handles the update route' do
        expect(put: '/campaigns/1/characters/1').to route_to('characters#update', id: '1', campaign_id: '1')
      end
      it 'handles the delete route' do
        expect(delete: '/campaigns/1/characters/1').to route_to('characters#destroy', id: '1', campaign_id: '1')
      end
    end
  end

  context 'story routes' do
    it 'handles the index route' do
      expect(get: '/campaigns/1/stories').to route_to('stories#index', campaign_id: '1')
    end
    it 'handles the show route' do
      expect(get: '/stories/1').to route_to('stories#show', id: '1')
    end
    it 'handles the new route' do
      expect(get: '/campaigns/1/stories/new').to route_to('stories#new', campaign_id: '1')
    end
    it 'handles the create route' do
      expect(post: '/campaigns/1/stories').to route_to('stories#create', campaign_id: '1')
    end
    it 'handles the edit route' do
      expect(get: '/stories/1/edit').to route_to('stories#edit', id: '1')
    end
    it 'handles the update route' do
      expect(put: '/stories/1').to route_to('stories#update', id: '1')
    end
    it 'handles the delete route' do
      expect(delete: '/stories/1').to route_to('stories#destroy', id: '1')
    end

    context 'chapter routes' do
      it 'handles the index route' do
        expect(get: '/stories/1/chapters').to route_to('chapters#index', story_id: '1')
      end
      it 'handles the show route' do
        expect(get: '/stories/1/chapters/1').to route_to('chapters#show', story_id: '1', id: '1')
      end
      it 'handles the new route' do
        expect(get: '/stories/1/chapters/new').to route_to('chapters#new', story_id: '1')
      end
      it 'handles the create route' do
        expect(post: '/stories/1/chapters').to route_to('chapters#create', story_id: '1')
      end
      it 'handles the edit route' do
        expect(get: '/stories/1/chapters/1/edit').to route_to('chapters#edit', id: '1', story_id: '1')
      end
      it 'handles the update route' do
        expect(put: '/stories/1/chapters/1').to route_to('chapters#update', id: '1', story_id: '1')
      end
      it 'handles the delete route' do
        expect(delete: '/stories/1/chapters/1').to route_to('chapters#destroy', id: '1', story_id: '1')
      end
    end
  end

  context 'forum routes' do
    # it 'handles the index route' do
    #   expect(get: '/forums').to route_to('forums#index')
    # end
    it 'handles the show route' do
      expect(get: '/forums/1').to route_to('forums#show', id: '1')
    end
    # it 'handles the edit route' do
    #   expect(get: '/stories/1/chapters/1/edit').to route_to('chapters#edit', id: '1', story_id: '1')
    # end
    #     it 'handles the update route' do
    #       expect(put: '/stories/1/chapters/1').to route_to('chapters#update', id: '1', story_id: '1')
    #     end
    context 'post routes' do
      it 'handles the index route' do
        expect(get: '/forums/1/posts').to route_to('posts#index', forum_id: '1')
      end
      it 'handles the show route' do
        expect(get: '/forums/1/posts/1').to route_to('posts#show', forum_id: '1', id: '1')
      end
      it 'handles the new route' do
        expect(get: '/forums/1/posts/new').to route_to('posts#new', forum_id: '1')
      end
      it 'handles the create route' do
        expect(post: '/forums/1/posts').to route_to('posts#create', forum_id: '1')
      end
      it 'handles the edit route' do
        expect(get: '/forums/1/posts/1/edit').to route_to('posts#edit', id: '1', forum_id: '1')
      end
      it 'handles the update route' do
        expect(put: '/forums/1/posts/1').to route_to('posts#update', id: '1', forum_id: '1')
      end
      it 'handles the delete route' do
        expect(delete: '/forums/1/posts/1').to route_to('posts#destroy', id: '1', forum_id: '1')
      end
    end
  end
end
