Rails.application.routes.draw do
  get 'trips/index'

  get 'passengers/index'

  get 'drivers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers, :passengers, :trips
end
