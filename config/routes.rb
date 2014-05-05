SoftwareEngFinalProject::Application.routes.draw do


  root 'sessions#new'
  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create'
  get '/signin' => 'sessions#new',  as: 'signin'
  delete '/signout' => 'sessions#destroy', as: 'signout'
  resources :relationships, only: [:show, :new, :create, :update]
  resources :sessions, only: [:new, :create]
  resources :users, only:[:edit,:update,:index]
  resources :users, only:[:show] do
    resources :posts, only:[:edit,:update,:create,:destroy,:index,:new]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get 'users/:id/relationships(.:format)' => 'relationships#user_index', as: 'user_relationships'
  match 'users/:id/relationships(.:format)', to: 'relationships#update', via: 'patch'

  # get '/users/:user_id/friends' => 'relationships#index'
  # post '/users/:user_id/friends' => 'relationships#create'

  # resources :relationships


  # match 'users/', to: 'relationship#request', via: 'post'
  # # post '/' => 'users#show'
  # get '/users/:id(.:format)' => 'users#show' # user profile
  # get '/users/:id(.:format)/newsfeed' => 'users#newsfeed' # user news feed

  # # edit_user GET    /users/:id/edit(.:format) users#edit
  # get '/users/:id/edit(.:format)' => 'users#edit' # edit preferences

  # post GET    /posts/:id(.:format)      posts#show


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
