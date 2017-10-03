Rails.application.routes.draw do

  get 'passenger/index'

  get 'passenger/new'

  get 'passenger/show'

  get 'passenger/edit'

  get 'passenger/update'

  get 'passenger/create'

  get 'passenger/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'

  resources :passengers

end
