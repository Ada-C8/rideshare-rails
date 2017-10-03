Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :passengers
  resources :drivers
  resources :trips

  # get "/passengers", to: "passengers#index", as: "passengers"
  # get "/passengers/new", to: "passengers#new", as: "passengers_new"
  # post "/passengers", to: "passengers#create"
  # get "/passengers/:id", to: "passengers#show", as: "passenger"
  #
  # get "/drivers", to: "drivers#index", as: "drivers"
  # get "/drivers/new", to: "drivers#new", as: "drivers_new"
  # post "/drivers", to: "drivers#create"
  # get "/drivers/:id", to: "drivers#show", as: "driver"
  #
  # get "/trips", to: "trips#index"
  # get "/trips/new", to: "trips#new"
  # post "/trips", to: "trips#create"
  # get "/trips/:id", to: "trips#show", as: "trip"
end
