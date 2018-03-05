Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'users/followers'

  get 'users/followings'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'followings'
      get 'followers'
    end
  end
  
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
