Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # show all list
    get "/passengers", to: "passengers#index", as: "passengers"
    get "/drivers", to: "drivers#index", as: "drivers"
    get "/trips", to: "trips#index"

# new passenger, drivers, and trips:
  get "/passengers/new", to: "passengers#new", as: "passengers_new"
  post "/passengers", to: "passengers#create"
  get "/drivers/new", to: "drivers#new", as: "drivers_new"
  post "/drivers", to: "drivers#create"
  get "/trips/new", to: "trips#new"
  post "/trips", to: "trips#create"



# show individual details
  get "/passengers/:id", to: "passengers#show", as: "passenger"
  get "/drivers/:id", to: "drivers#show", as: "driver"
  get "/trips/:id", to: "trips#show", as: "trip"
end
