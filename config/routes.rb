Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :drivers
  resources :passengers do
    resources :trips, only: [:index, :new]
    # get '/passengers/:passenger_id/trips', to: 'trips#index', as: 'passenger_trips'
    # get '/passengers/:passenger_id/trips/new', to: 'trips#new', as: 'new_passenger_trip'
  end
   #only: [:index, :new, :create, :show] #no option to delete, edit, don't have extras lying around.
  resources :trips

end
