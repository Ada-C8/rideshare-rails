Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :drivers
resources :passengers
resources :trips
  get '/home', to:'home#index', as:'home'
end
