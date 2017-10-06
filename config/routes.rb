Rails.application.routes.draw do

root to: 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'

  patch '/drivers/:id/available', to: 'drivers#available', as: 'driver_available'
  resources :drivers do
    resources :trips, only: [:index]
  end

  resources :passengers do
    resources :trips, only: [:index, :new]
  end

  resources :trips

end
