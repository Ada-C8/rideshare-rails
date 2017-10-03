Rails.application.routes.draw do

# trip routes
  root to: "trips#home", as: "root"

  get "/trips", to: "trips#index", as: "trip_index"
  get "trips/:id/edit", to: "trips#edit", as: "edit_trip"
  get "trips/new", to: "trips#new", as: "new_trip"
  get "trips/:id", to: "trips#show", as: "trip"
  patch "trips/:id", to: "trips#update", as: "update_trip"
  post "trips", to: "trips#create", as: "create_trip"
  delete "trips/:id", to: "trips#destroy", as: "destroy_trip"

# driver routes

get "/drivers", to: "drivers#index", as: "driver_index"
get "drivers/:id/edit", to: "drivers#edit", as: "edit_driver"
get "drivers/new", to: "drivers#new", as: "new_driver"
get "drivers/:id", to: "drivers#show", as: "driver"
patch "drivers/:id", to: "drivers#update", as: "update_driver"
post "drivers", to: "drivers#create", as: "create_driver"
delete "drivers/:id", to: "drivers#destroy", as: "destroy_driver"

# passenger routes

get "/passengers", to: "passengers#index", as: "passenger_index"
get "passengers/:id/edit", to: "passengers#edit", as: "edit_passenger"
get "passenger/new", to: "passenger#new", as: "new_passenger"
get "passengers/:id", to: "passengers#show", as: "passenger"
patch "passengers/:id", to: "passengers#update", as: "update_passenger"
post "passengers", to: "passengers#create", as: "create_passenger"
delete "passengers/:id", to: "passengers#destroy", as: "destroy_passenger"
end
