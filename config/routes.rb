Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# new passenger, drivers, and trips:
  get "/passengers/new", to: "passengers#new"
  post "/passengers", to: "passengers#create"
  get "/drivers/new", to: "drivers#new"
  post "/drivers", to: "drivers#create"
  get "/trips/new", to: "trips#new"
  post "/trips", to: "trips#create"

# show all list
  get "/passengers", to: "passengers#index"
  get "/drivers", to: "drivers#index"
  get "/trips", to: "trips#index"

# show individual details
  get "/passengers/:id", to: "passengers#show", as: "passenger"
  get "/drivers/:id", to: "drivers#show", as: "driver"
  get "/trips/:id", to: "trips#show", as: "trip"
end
