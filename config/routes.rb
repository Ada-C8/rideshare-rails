Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers, only: [:index, :new, :create]
  resources :passengers, only: [:index, :new, :create]
  resources :trips, only: [:index, :new, :create]

  root 'home#index'
end
