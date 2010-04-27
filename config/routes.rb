GameMaster::Application.routes.draw do |map|

  devise_for :users, :path_names=> { :sign_in=>'login', 
                     :sign_out=>'logout', 
                     :sign_up=>'register'}

  resources :users

  resources :campaigns do #shallow=>true
      resources :stories do
        resources :chapters
      end
      resources :characters
      resources :forums
      resources :locations
  end
  resources :stories do
    resources :chapters
  end
  resources :chapters
  resources :characters
  resources :forums
  resources :locations
 
  resources :forums do #shallow=>true
    resources :posts
  end
  resources :posts

  root :to => "users#login"
    
end

