Rails.application.routes.draw do

  resources :home, only: [:index]
  root "home#index"
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :secret, only: [:index]
  resources :gossips
  resources :authors
end
