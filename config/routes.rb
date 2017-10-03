Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/passengers'
  # root 'main#index'

  get '/', to: 'main#index'

  ###### DRIVERS ######
  # # VERB    PATH    # CONTROLLERACTION   PREFIX
  # get "/drivers", to: "drivers#index", as: "drivers"
  #
  # get "/drivers/new", to: "drivers#new", as: "new_driver"
  # post "/drivers", to: "drivers#create"
  #
  # get "/drivers/:id", to: "drivers#show", as: "driver"
  #
  # get "/driver/:id/edit", to: "drivers#edit", as: "edit_driver"
  # patch "/drivers/:id", to: "drivers#update"
  #
  # delete "/driver/:id", to: "drivers#destroy"

  resources :drivers

  ###### PASSENGERS ######
  # get "/passengers", to: "passengers#index", as: "passengers"
  #
  # get "/passengers/new", to: "passengers#new", as: "new_passenger"
  # post "/passengers", to: "passengers#create"
  #
  # get "/passengers/:id", to: "passengers#show", as: "passenger"
  #
  # get "/passenger/:id/edit", to: "passengers#edit", as: "edit_passenger"
  # patch "/passengers/:id", to: "passengers#update"
  #
  # delete "/passenger/:id", to: "passengers#destroy"

  resources :passengers

  ###### TRIPS ######
  # get "/trips", to: "trips#index", as: "trips"
  #
  # get "/trips/new", to: "trips#new", as: "new_trip"
  # post "/trips", to: "trips#create"
  #
  # get "/trips/:id", to: "trips#show", as: "trip"
  #
  # get "/trip/:id/edit", to: "trips#edit", as: "edit_trip"
  # patch "/trips/:id", to: "trips#update"
  #
  # delete "/trip/:id", to: "trips#destroy"
   resources :trips
end
