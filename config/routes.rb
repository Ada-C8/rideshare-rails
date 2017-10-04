Rails.application.routes.draw do

# trip routes
  root to: "trips#home", as: "root"

  patch '/drivers/:id/status', to: 'drivers#status', as: 'status' #status_path
#   get "/trips", to: "trips#index", as: "trips"
#   get "trips/:id/edit", to: "trips#edit", as: "edit_trip"
#   get "trips/new", to: "trips#new", as: "new_trip"
#   get "trips/:id", to: "trips#show", as: "trip"
#   patch "trips/:id", to: "trips#update"
#   post "trips", to: "trips#create"
#   delete "trips/:id", to: "trips#destroy"
#
# # driver routes
#
# get "/drivers", to: "drivers#index", as: "drivers"
# get "drivers/:id/edit", to: "drivers#edit", as: "edit_driver"
# get "drivers/new", to: "drivers#new", as: "new_driver"
# get "drivers/:id", to: "drivers#show", as: "driver"
# patch "drivers/:id", to: "drivers#update"
# post "drivers", to: "drivers#create"
# delete "drivers/:id", to: "drivers#destroy"
#
# # passenger routes
#
# get "/passengers", to: "passengers#index", as: "passengers"
# get "passengers/:id/edit", to: "passengers#edit", as: "edit_passenger"
# get "passengers/new", to: "passengers#new", as: "new_passenger"
# get "passengers/:id", to: "passengers#show", as: "passenger"
# patch "passengers/:id", to: "passengers#update"
# post "passengers", to: "passengers#create"
# delete "passengers/:id", to: "passengers#destroy"
resources :passengers
resources :drivers
resources :trips

end
