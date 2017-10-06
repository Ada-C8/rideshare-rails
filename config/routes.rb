Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'main#index'
  get '/', to: 'main#index', as: 'root'

  ###### DRIVERS ######
  # # VERB    PATH    # CONTROLLERACTION   PREFIX
  # get "/drivers", to: "drivers#index", as: "drivers" YES

  # get "/drivers/new", to: "drivers#new", as: "new_driver" YES
  # post "/drivers", to: "drivers#create" YES
  #
  # get "/drivers/:id", to: "drivers#show", as: "driver" YES
  #
  # get "/driver/:id/edit", to: "drivers#edit", as: "edit_driver" YES
  # patch "/drivers/:id", to: "drivers#update" YES
  #
  # delete "/driver/:id", to: "drivers#destroy" YES

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

  get "/passengers/:id/trips/new", to: "trips#new", as: "new_passenger_trip"
  post "/passengers/:id/trips", to: "trips#create"

  resources :passengers

  ###### TRIPS ######
  # get "/trips", to: "trips#index", as: "trips" NO?
  #
  # get "/trips/new", to: "trips#new", as: "new_trip" YES
  # post "/trips", to: "trips#create" YES
  #
  # get "/trips/:id", to: "trips#show", as: "trip" YES
  #
  # get "/trip/:id/edit", to: "trips#edit", as: "edit_trip" YES
  # patch "/trips/:id", to: "trips#update" YES
  #
  # delete "/trip/:id", to: "trips#destroy" YES
   resources :trips, except: :index  # we don't use index in our trip
end
