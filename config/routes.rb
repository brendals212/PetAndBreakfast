Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show]
  resources :pets
  resources :users, only: [:edit, :update]
  resources :dashboard do
    member do
      get 'profile'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
