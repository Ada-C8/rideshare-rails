Rails.application.routes.draw do

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~App~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  root to: 'rideshare#index'
  get '/rideshare/index', to: 'rideshare#index', as: 'rideshares'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Passengers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  resources :passengers
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Drivers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  resources :drivers
  patch 'driver/:id/status', to: 'drivers#update_status', as: 'driver_status'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Trips~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/trips', to: 'trips#index', as: 'trips'
  get '/trips/new/:passenger_id', to: 'trips#new', as: 'new_trip'
  post '/trips/create', to: 'trips#create', as: 'create_trip'
  get '/trips/:id', to: 'trips#show', as: 'trip'
  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch '/trips/:id/rate', to: 'trips#add_rating', as: 'rate_trip'
  patch '/trips/:id', to: 'trips#update', as: 'update_trip'
  delete '/trips/:id', to: 'trips#destroy', as: 'delete_trip'
end
