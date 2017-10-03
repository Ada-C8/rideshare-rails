Rails.application.routes.draw do
  # get '/trips'
  #
  # get '/trips/show'
  #
  # get '/trips/new'
  #
  # get '/trips/create'
  #
  # get '/trips/edit'
  #
  # get '/trips/update'
  #
  # get '/trips/destroy'

  get '/passengers', to: 'passengers#index'

  get '/passengers/new', to: "passengers#new", as: "new_passenger"

  post '/passengers', to: "passengers#create"

  # get '/passengers/show'
  #
  # get '/passengers/edit'
  #
  # get '/passengers/update'
  #
  # get '/passengers/destroy'

  get '/drivers', to: 'drivers#index'

  # get '/drivers/show'
  #
  # get '/drivers/edit'
  #
  # get '/drivers/update'
  #
  get '/drivers/new', to: 'drivers#new', as: "new_driver"
  #
  post '/drivers', to: "drivers#create"
  #
  # get '/drivers/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
