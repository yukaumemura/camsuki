Rails.application.routes.draw do
  
  get 'cam_search/index'

  get 'it_skills/ItItem'

  get 'ranking/have', to: 'ranking#have' 
  get 'ranking/want', to: 'ranking#want' 

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
  resources :it_skills
end
