Rails.application.routes.draw do
  resources :posts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :users
  get '/sign_in'  => 'authors#sign_in'
  root 'users#index'
  # post '/omniauth/:provider/callback', to: 'devise_token_auth/omniauth_callbacks#redirect_callbacks'
  # get '/omniauth/:provider/callback', to: 'sessions#create'
  #   namespace :api do
  #     scope :v1 do
  #   mount_devise_token_auth_for 'Author', at: 'auth', skip: [:omniauth_callbacks]
  # end
  # end
  # devise_for :authors

     # namespace :api do
      mount_devise_token_auth_for 'Author', at: 'auth', controllers: {
        token_validations:  'overrides/token_validations',
        omniauth_callbacks: 'overrides/omniauth_callbacks'
      }
    # end
  # get '*path' => "authors#index"
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
