SoftwareEngFinalProject::Application.routes.draw do

  resources :users do
    resources :posts, :relationships
  end
  resources :sessions, only: [:new, :create, :destroy]


  root 'sessions#new'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  # match '/request_friend', to: 'relationships#request', via: 'get'
  # match '/request_friend', to: 'relationships#request', via: 'post'
  



end
