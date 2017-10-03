Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'passengers', to: 'passengers#index', as: 'passengers'

  get 'drivers', to: 'drivers#index', as: 'drivers'
end
