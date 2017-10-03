Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  resources :drivers, :passengers
  resources :trips, except: [:index, :new]

  get '/trips/new/:id', to: 'trips#new', as: 'new_trip'

end
