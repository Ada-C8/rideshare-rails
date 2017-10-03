Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/show'

  get 'trips/edit'

  get 'trips/update'

  get 'trips/new'

  get 'trips/create'

  get 'trips/destroy'


  get '/passengers', to: 'passengers#index'

  get '/passengers/new', to: "passengers#new", as: 'new_passenger'

  get '/passengers/:id/edit', to: 'passengers#edit'

  get '/passengers/:id', to: "passengers#show", as: 'passenger'

  patch 'passengers/:id', to: 'passengers#update'

  post 'passengers', to: "passengers#create"

  get 'passengers/destroy'


  get '/drivers', to: 'drivers#index'

  get '/drivers/new', to: "drivers#new", as: 'new_driver'

  get '/drivers/:id/edit', to: 'drivers#edit'

  get 'drivers/:id', to: "drivers#show", as: 'driver'

  patch 'drivers/:id', to: 'drivers#update'

  post '/drivers', to: "drivers#create"

  get 'drivers/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
