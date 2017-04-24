Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end

  get 'favs', to: 'users#likings'
  resources :microposts, only: [:create, :destroy, :show] do
    member do
      get :likings
      get :likeds
    end
  end
  



  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  
end
