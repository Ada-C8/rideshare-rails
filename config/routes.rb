Rails.application.routes.draw do

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~App~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  root to: 'rideshare#index'
  get '/rideshare/index', to: 'rideshare#index', as: 'rideshares'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Passengers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  resources :passenger
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
  resources :driver
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
  get 'trip/:id', to: 'trip#show', as: 'trip'
  get 'trip/:id', to: 'trip#edit', as: 'edit_trip'
end
