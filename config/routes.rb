Rails.application.routes.draw do
  get 'trips/index'

  get 'drivers/index'

  get 'passengers/index'

  resources :drivers
  resources :passengers
  # do
  #   resources :trips
  #   #, only: [:index, :new]
  # end
  resources :trips


  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #******* DIANES ATTEMPT
  get('passengers/:id/trips', to: 'trips#index', as: 'passenger_trips')
  get('passengers/:id/trips/new', to:'trips#new', as: 'new_passenger_trip')
  post('passengers/:id/trips', to: 'trips#create')
  #*******
end
