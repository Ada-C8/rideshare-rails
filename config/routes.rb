Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/passengers", to: "passengers#index"
  get "/drivers", to: "drivers#index"
  get "/trips", to: "trips#index"

  get "/passengers/:id", to: "passengers#show", as: "passenger"
  get "/drivers/:id", to: "drivers#show", as: "driver"

end
