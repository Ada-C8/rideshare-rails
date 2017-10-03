Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers
  # get 'drivers', to: 'drivers#index', as: 'drivers'
  # get 'drivers/:id', to: 'drivers#show', as: 'driver'

  resources :passengers
  # get 'passengers', to: 'passengers#index', as: 'passengers'
  # get 'passengers/:id', to: 'passengers#show', as: 'passenger'


  get 'trips', to: 'trips#index', as: 'trips'

  get 'trips/:id', to: 'trips#show', as: 'trip'
end
