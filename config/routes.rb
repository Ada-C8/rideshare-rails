Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :trips
  resources :drivers
  patch 'drivers/:id/available', to: 'drivers#available', as: 'available'
  # get 'drivers/', to: 'drivers#next', as: 'next'
  resources :passengers do
    post 'create_trip'
  end

  resources :welcome, only: [:index]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
