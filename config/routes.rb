Rails.application.routes.draw do

  get 'trips/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers, only: [:index, :new, :create, :show]
  resources :passengers, only: [:index, :new, :create, :show, :edit, :update]
  resources :trips, only: [:index, :new, :create, :show]

  root 'home#index'
end
