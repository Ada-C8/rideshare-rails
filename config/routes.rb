Rails.application.routes.draw do
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~App~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  root to: 'rideshare#index'
  get '/rideshare/index', to: 'rideshare#index', as: 'rideshares'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Passengers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/passenger/index', to: 'passenger#index', as: 'passengers'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Drivers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get '/driver/index', to: 'driver#index', as: 'drivers'
  get 'driver/:id', to: 'driver#show', as: 'driver'

  get 'driver/edit'

  get 'driver/update'

  get 'driver/new'

  get 'driver/create'

  get 'driver/destroy'
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~Trips~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
end
