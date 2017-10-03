Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/drivers/new", to: "drivers#new", as: "new_driver"

  post "/drivers", to: "drivers#create", as: 'drivers'

  get "/drivers", to: "drivers#index", as: 'index'

  get "/drivers/:id", to: "drivers#show", as: "driver"

  get "/passengers/new", to: "passengers#new", as: "new_passengers"

  post "/passengers", to: "passengers#create", as: 'passengers'

  get "/passengers", to: "passengers#index", as: 'passenger_index'

  get "/passengers/:id", to: "passengers#show", as: "passenger"
end
