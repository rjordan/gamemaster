GameMaster::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :campaigns, only: [:index, :show]
      resources :profiles, only: [:show]
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, path_names: { sign_in: 'login',
                                   sign_out: 'logout',
                                   sign_up: 'register' }

  resources :users, only: [:show, :edit]

  resources :campaigns do
    resources :stories, only: [:index, :new, :create]
    resources :characters
    resources :forums
    resources :campaign_resources
    resources :campaign_invites
  end

  resources :stories, except: [:index, :new] do
    resources :chapters do
      collection do
        post :sort
      end
    end
  end

  # resources :campaign_invites

  #  resources :campaign_resources
  #  resources :characters
  resources :forums, only: [:show] do
    resources :posts, only: [:index, :new, :create]
  end
  resources :posts, only: [:show, :edit, :update, :destroy]

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'campaigns#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
