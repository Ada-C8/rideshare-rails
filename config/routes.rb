Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'passengers#index'

  get '/passengers', to: 'passengers#index', as: 'passengers'

  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'

  patch '/passengers/:id', to: 'passengers#update', as: 'update_passenger'

  post '/passengers', to: 'passengers#create', as: 'create_passenger'

  delete '/passengers/:id', to: 'passengers#destroy', as: 'delete_passenger'

end
