Rails.application.routes.draw do
  get "/drivers", to: "drivers#index", as: "drivers"
  get "/drivers/new", to: "drivers#new", as: "new_driver"
  get "/drivers/:id", to: "drivers#show", as: "driver"
  get "drivers/:id/edit", to: "drivers#edit", as: "edit_driver"

  post "/drivers",  to: "drivers#create", as: 'create_task'

  patch "drivers/:id", to: 'drivers#update'


  delete 'drivers/:id', to: 'drivers#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/passengers', to: 'passengers#index'

  post 'passengers', to: 'passengers#create'

  get 'passengers/new', to: 'passengers#new', as: 'new_passenger'

  get 'passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  patch 'passengers/:id', to: 'passengers#update'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'

  delete '/passengers/:id', to: 'passengers#destroy'



end
