Rails.application.routes.draw do

  resources :drivers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :passengers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :trips, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :passengers do
    resources :trips
  end

  root 'home#index'
end
