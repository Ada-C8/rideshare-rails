Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :passengers do
    resources :trips
    # resources :trips, only: [:index, :new, :create]

  end
  resources :drivers do
    resources :trips, only: [:index]
  end
  resources :trips, only: [:show, :edit, :destroy]
end
