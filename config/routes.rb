Rails.application.routes.draw do

  root to: "home#index"
  get 'home/index', to: 'home#index', as: 'home' #home#path



  get '/trips/', to: 'trips#index', as: 'trips' #trips_path

  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip' #edit_trips_path

  get '/trips/new', to: 'trips#new', as:'new_trip' #new_trip_path

  get '/trips/:id', to: 'trips#show', as:'trip' #trip_path

  patch 'trips/:id', to: 'trips#update', as:'update_trip' #update_trip_path

  post '/trips', to: 'trips#create', as:'create_trip' #create_trip_path

  delete '/trips/:id', to: 'trips#destroy', as: 'delete_trip' #delete_trip_path




  get '/passengers/', to: 'passengers#index', as: 'passengers' #passengers_path

  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger' #edit_passengers_path

  get '/passengers/new', to: 'passengers#new', as:'new_passenger' #new_passenger_path

  get '/passengers/:id', to: 'passengers#show', as:'passenger' #passenger_path

  patch 'passengers/:id', to: 'passengers#update', as:'update_passenger' #update_passenger_path

  post '/passengers', to: 'passengers#create', as:'create_passenger' #create_passenger_path

  delete '/passengers/:id', to: 'passengers#destroy', as: 'delete_passenger' #delete_passenger_path




  get '/drivers/', to: 'drivers#index', as: 'drivers' #drivers_path

  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver' #edit_drivers_path

  get '/drivers/new', to: 'drivers#new', as:'new_driver' #new_driver_path

  get '/drivers/:id', to: 'drivers#show', as:'driver' #driver_path

  patch 'drivers/:id', to: 'drivers#update', as:'update_driver' #update_driver_path

  post '/drivers', to: 'drivers#create', as:'create_driver' #create_driver_path

  delete '/drivers/:id', to: 'drivers#destroy', as: 'delete_driver' #delete_passenger_path


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
