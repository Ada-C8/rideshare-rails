Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/show'

  get 'trips/create'

  get 'trips/update'

  get 'trips/destroy'

  get 'trips/edit'

  get 'trips/new'

  get 'passengers/index'

  get 'passengers/show'

  get 'passengers/create'

  get 'passengers/update'

  get 'passengers/destroy'

  get 'passengers/edit'

  get 'passengers/new'

  get 'drivers/index'

  get 'drivers/show'

  get 'drivers/create'

  get 'drivers/update'

  get 'drivers/destroy'

  get 'drivers/edit'

  get 'drivers/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
