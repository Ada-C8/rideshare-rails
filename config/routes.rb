Rails.application.routes.draw do

  root to: 'passengers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch '/drivers/:id/available', to: 'drivers#available', as: 'driver_available'
  resources :drivers
  # get 'drivers', to: 'drivers#index', as: 'drivers'
  # get 'drivers/:id', to: 'drivers#show', as: 'driver'

  resources :passengers
  get 'passengers/:id/trips', to: 'trips#index', as: 'passenger_trips'
  get 'passengers/:id/trips/new', to: 'trips#new', as: 'new_passenger_trip'
  # get 'passengers', to: 'passengers#index', as: 'passengers'
  # get 'passengers/:id', to: 'passengers#show', as: 'passenger'

  resources :trips


  #get 'trips', to: 'trips#index', as: 'trips'
  #get 'trips/:id', to: 'trips#show', as: 'trip'
end
