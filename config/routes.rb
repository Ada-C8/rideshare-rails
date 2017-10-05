Rails.application.routes.draw do

  get '/trips', to: 'trips#index'

  get '/trips/new', to: 'trips#new', as: 'new_trip'

  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'

  get '/trips/:id/edit_rating', to:'trips#edit_rating', as: 'edit_rating'

  get '/trips/:id', to: 'trips#show', as: 'trip'

  patch '/trips/:id', to:'trips#update_rating'

  # patch '/trips/:id', to: 'trips#update'

  post '/trips', to: 'trips#create', as: 'create_trip'

  get '/trips/destroy/:id', to: 'trips#destroy', as: 'delete_trip'


  get '/passengers', to: 'passengers#index'

  get '/passengers/new', to: "passengers#new", as: 'new_passenger'

  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  get '/passengers/:id', to: "passengers#show", as: 'passenger'

  patch 'passengers/:id', to: 'passengers#update'

  post 'passengers', to: "passengers#create"

  delete '/passengers/destroy/:id', to: 'passengers#destroy', as: 'delete_passenger'


  get '/drivers', to: 'drivers#index'

  get '/drivers/new', to: "drivers#new", as: 'new_driver'

  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'

  get 'drivers/:id', to: "drivers#show", as: 'driver'

  patch 'drivers/:id', to: 'drivers#update'

  post '/drivers', to: "drivers#create"

  delete '/drivers/destroy/:id', to: 'drivers#destroy', as: 'delete_driver'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
