Rails.application.routes.draw do
  get "/drivers", to: "drivers#index", as: "drivers"
  get "/drivers/:id", to: "drivers#show", as: "driver"
  get "/drivers/new", to: "drivers#new", as: "new_driver"
  get "drivers/:id/edit", to: "drivers#edit", as: "edit_driver"

  post "/drivers",  to: "drivers#create", as: 'create_task'

  patch "drivers/:id", to: 'drivers#update'


  delete 'drivers/:id', to: 'drivers#destroy'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
