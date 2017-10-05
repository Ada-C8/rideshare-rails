Rails.application.routes.draw do


  get 'drivers/index'

  get 'drivers/new'

  get 'drivers/create'

  get 'drivers/edit'

  get 'drivers/update'

  get 'drivers/show'

  get 'drivers/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'

  get '/trips', to: 'trips#index'

  resources :passengers do
    resources :trips
  end
end
