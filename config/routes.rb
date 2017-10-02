Rails.application.routes.draw do
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~App~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  root to: 'rideshare#index'
  get '/rideshare/index', to: 'rideshare#index', as: 'rideshare_index'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Passengers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/passenger/index', to: 'passenger#index', as: 'passenger_index'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Drivers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/driver/index', to: 'driver#index', as: 'driver_index'
  get 'driver/show'

  get 'driver/edit'

  get 'driver/update'

  get 'driver/new'

  get 'driver/create'

  get 'driver/destroy'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Trips~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
end
