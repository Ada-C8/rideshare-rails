Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :drivers, :passengers do
    resources :trips, only: [:index, :new, :show]
  end
  resources :trips, only: [:edit, :destroy]
end
