Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home', as: 'root' #root_path
  
  #RIDERS
  get 'riders', to: 'riders#index', as: 'riders' #riders_path

  get 'riders/:id/edit', to: 'riders#edit', as: 'edit_rider' #edit_rider_path

  get 'riders/new', to: 'riders#new', as: 'new_rider' #new_rider_path

  get 'riders/:id', to: 'riders#show', as: 'rider' #rider_path

  patch 'riders/:id', to: 'riders#update', as: 'update_rider' #update_rider_path

  post 'riders', to: 'riders#create', as: 'create_rider' #create_rider_path

  delete 'riders/:id', to: 'riders#destroy', as: 'delete_rider' #delete_rider_path

  #DRIVERS
  get 'drivers', to: 'drivers#index', as: 'drivers' #drivers_path

  get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver' #edit_driver_path

  get 'drivers/new', to: 'drivers#new', as: 'new_driver' #new_driver_path

  get 'drivers/:id', to: 'drivers#show', as: 'driver' #driver_path

  patch 'drivers/:id', to: 'drivers#update', as: 'update_driver' #update_driver_path

  post 'drivers', to: 'drivers#create', as: 'create_driver' #create_driver_path

  delete 'drivers/:id', to: 'drivers#destroy', as: 'delete_driver' #delete_driver_path

  #TRIPS
  get 'trips', to: 'trips#index', as: 'trips' #trips_path

  get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip' #edit_trip_path

  get 'trips/:id', to: 'trips#show', as: 'trip' #trip_path

  patch 'trips/:id', to: 'trips#update', as: 'update_trip' #update_trip_path

  post 'trips', to: 'trips#create', as: 'create_trip' #create_trip_path

  delete 'trips/:id', to: 'trips#destroy', as: 'delete_trip' #delete_trip_path

end
