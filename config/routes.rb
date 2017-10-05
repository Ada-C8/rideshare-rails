Rails.application.routes.draw do
  root to: "trips#index"

  get "/trips", to: "trips#index", as: "trips"

  get '/trips/new', to: "trips#new", as: "new_trip"
  #
  get '/trips/:id', to: "trips#show", as: "trip"

  get '/trips/:id/edit_rating', to: 'trips#edit_rating', as: 'edit_rating'

  get '/trips/:id/edit', to: 'trips#edit', as: "edit_trip"

  patch 'trips/:id', to: 'trips#update'

  patch '/trips/:id/update_rating', to: 'trips#update_rating'

  post '/trips', to: "trips#create", as: "create_trip"

  delete '/trips/:id', to: 'trips#destroy', as: "delete_trip"



  get '/passengers', to: 'passengers#index'

  get '/passengers/:id/edit', to: 'passengers#edit', as: "edit_passenger"

  patch '/passengers/:id', to: 'passengers#update'

  get '/passengers/new', to: "passengers#new", as: "new_passenger"

  post '/passengers', to: "passengers#create"

  get '/passengers/:id', to: "passengers#show", as: 'passenger'

  delete '/passengers/destroy/:id', to: "passengers#destroy", as: "delete_passenger"



  get '/drivers', to: 'drivers#index'

  get '/drivers/:id/edit', to: "drivers#edit", as: "edit_driver"

  patch '/drivers/:id', to: "drivers#update"

  get '/drivers/new', to: 'drivers#new', as: 'new_driver'

  post '/drivers', to: "drivers#create"

  get '/drivers/:id', to: 'drivers#show', as: 'driver'

  delete '/drivers/destroy/:id', to:"drivers#destroy", as: "delete_driver"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
