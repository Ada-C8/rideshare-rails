Rails.application.routes.draw do

# trip routes
  root to: "trips#home", as: "root"

  get "/trips", to: "trips#index", as: "trips"
  get "trips/:id/edit", to: "trips#edit", as: "edit_trip"
  get "trips/new", to: "trips#new", as: "new_trip"
  get "trips/:id", to: "trips#show", as: "trip"
<<<<<<< HEAD
  patch "trips/:id", to: "trips#update"
  post "trips", to: "trips#create"
  delete "trips/:id", to: "trips#destroy"
=======
  patch "trips/:id", to: "trips#update", as: "update_trip"
  post "trips", to: "trips#create", as: "create_trip"
  delete "trips/:id", to: "trips#destroy", as: "destroy_trip"
>>>>>>> be61e98b89f026626d4dbec4672699c2ebef9a49

# driver routes

get "/drivers", to: "drivers#index", as: "drivers"
get "drivers/:id/edit", to: "drivers#edit", as: "edit_driver"
get "drivers/new", to: "drivers#new", as: "new_driver"
get "drivers/:id", to: "drivers#show", as: "driver"
<<<<<<< HEAD
patch "drivers/:id", to: "drivers#update"
post "drivers", to: "drivers#create"
delete "drivers/:id", to: "drivers#destroy"
=======
patch "drivers/:id", to: "drivers#update", as: "update_driver"
post "drivers", to: "drivers#create", as: "create_driver"
delete "drivers/:id", to: "drivers#destroy", as: "destroy_driver"
>>>>>>> be61e98b89f026626d4dbec4672699c2ebef9a49

# passenger routes

get "/passengers", to: "passengers#index", as: "passengers"
get "passengers/:id/edit", to: "passengers#edit", as: "edit_passenger"
get "passenger/new", to: "passenger#new", as: "new_passenger"
get "passengers/:id", to: "passengers#show", as: "passenger"
<<<<<<< HEAD
patch "passengers/:id", to: "passengers#update"
post "passengers", to: "passengers#create"
delete "passengers/:id", to: "passengers#destroy"
=======
patch "passengers/:id", to: "passengers#update", as: "update_passenger"
post "passengers", to: "passengers#create", as: "create_passenger"
delete "passengers/:id", to: "passengers#destroy", as: "destroy_passenger"
>>>>>>> be61e98b89f026626d4dbec4672699c2ebef9a49
end
