GameMaster::Application.routes.draw do

  devise_for :users, :path_names=> { :sign_in=>'login', 
                     :sign_out=>'logout', 
                     :sign_up=>'register'}

  resources :users

  resources :campaigns do
      resources :stories
      resources :characters
      resources :forums
      resources :campaign_resources
      resources :campaign_invites
  end
  
  resources :campaign_invites
  
  resources :stories do
    resources :chapters do
      collection do
        post :sort
      end
    end
  end
  resources :chapters
  
  resources :campaign_resources
  resources :characters

  resources :forums do
    resources :posts
  end
  resources :posts

  root :to => "campaigns#index"
    
end

