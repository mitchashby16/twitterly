Rails.application.routes.draw do
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'users/new'
  get 'pages/home'
  get 'pages/about'

  root 'pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources :follows, only: [:create, :destroy]
end
