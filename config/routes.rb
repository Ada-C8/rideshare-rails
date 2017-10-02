Rails.application.routes.draw do

  get 'passengers/index'

  get 'drivers/index'

  root to: "trips#index", as: "root"

  get "/trips", to: "trips#index", as: "index"
  get "trips/:id/edit", to: "trips#edit", as: "edit_trip"
  get "trips/new", to: "trips#new", as: "new_trip"
  get "trips/:id", to: "trips#show", as: "trip"
  patch "trips/:id", to: "trips#update", as: "update_trip"
  post "trips", to: "trips#create", as: "create_trip"
  delete "trips/:id", to: "trips#destroy", as: "delete_trip"

end
