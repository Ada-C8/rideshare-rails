Rails.application.routes.draw do

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~App~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  root to: 'rideshare#index'
  get '/rideshare/index', to: 'rideshare#index', as: 'rideshares'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Passengers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  resources :passengers
  # get '/passenger/index', to: 'passenger#index', as: 'passengers'
  # get 'passenger/:id', to: 'passenger#show', as: 'passenger'
  #
  # get 'passenger/edit'
  #
  # get 'passenger/update'
  #
  # get 'passenger/new'
  #
  # get 'passenger/create'
  #
  # get 'passenger/destroy'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Drivers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  resources :drivers
  # get '/driver/index', to: 'driver#index', as: 'drivers'
  # get 'driver/:id', to: 'driver#show', as: 'driver'
  #
  # get 'driver/edit'
  #
  # get 'driver/update'
  #
  # get 'driver/new'
  #
  # get 'driver/create'
  #
  # get 'driver/destroy'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Trips~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/trips', to: 'trips#index', as: 'trips'
  get '/trips/new/:passenger_id', to: 'trips#new', as: 'new_trip'
  post '/trips/create', to: 'trips#create', as: 'create_trip'
  get '/trips/:id', to: 'trips#show', as: 'trip'
  get '/trips/:id', to: 'trips#edit', as: 'edit_trip'
  patch '/trips/:id', to: 'trips#update', as: 'update_trip'
  delete '/trips/:id', to: 'trips#destroy', as: 'delete_trip'
end
