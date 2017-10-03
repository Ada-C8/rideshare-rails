Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/show'

  get 'trips/new'

  get 'trips/create'

  get 'trips/edit'

  get 'trips/update'

  get 'trips/destroy'

  get '/passengers/index', to: 'passengers#index'

  get 'passengers/show'

  get 'passengers/edit'

  get 'passengers/update'

  get 'passengers/new'

  get 'passengers/create'

  get 'passengers/destroy'

  get 'drivers/index', to: 'drivers#index'

  get 'drivers/show'

  get 'drivers/edit'

  get 'drivers/update'

  get 'drivers/new'

  get 'drivers/create'

  get 'drivers/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
