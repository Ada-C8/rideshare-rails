Rails.application.routes.draw do
  get 'trips/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/passengers', to: 'passengers#index'

  post 'passengers', to: 'passengers#create'

  get 'passengers/new', to: 'passengers#new', as: 'new_passenger'

  get 'passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  patch 'passengers/:id', to: 'passengers#update'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'

  delete '/passengers/:id', to: 'passengers#destroy'



end
