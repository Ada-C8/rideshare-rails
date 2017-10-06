Rails.application.routes.draw do

  resources :drivers
  resources :passengers
  resources :trips
  get('passengers/:id/trips', to:'trips#create', as: 'passenger_trip')
  post('passengers/:id/trips', to: 'trips#create')

  root 'main#index'
end
