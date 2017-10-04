Rails.application.routes.draw do
  get 'trips/index'

  get 'drivers/index'

  get 'passengers/index'

  resources :drivers
  resources :passengers
  resources :trips

  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #******* DIANES ATTEMPT
  get('passenger/:id/trips', to: 'trips#new', as: 'new_passenger_trip')
  post('passengers/:id/trips', to: 'trips#create')
  #*******
end
