Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get '/drivers/sort_by_rating', to: 'drivers#sort_by_rating', as: 'drivers_sort_by_rating'
  resources :drivers
  resources :passengers do
    resources :trips, only: [:new]
  end
  resources :trips, except: [:index, :new]
  #
  # get '/trips/new/:id', to: 'trips#new', as: 'new_trip'



end
