Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
 root  'topics#index'

 resources :topics do
  resources :comments, only: [:create]
  collection do
    get 'search'
  end
 end

resources :kind_japanese, only: [:index]



end
