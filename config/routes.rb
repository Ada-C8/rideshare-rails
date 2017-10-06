Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :trips
  resources :drivers
  patch 'drivers/:id/available', to: 'drivers#available', as: 'available'
  resources :passengers
  resources :welcome, only: [:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
