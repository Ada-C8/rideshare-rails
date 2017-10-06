Rails.application.routes.draw do
# trip routes
  root to: "trips#home", as: "root"

  resources :drivers do
    patch 'status'
  end

  resources :trips, except: [:new]

  resources :passengers do
    resources :trips, only: [:new]
  end
end
