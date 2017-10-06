Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'main#index', as: 'root'

  resources :drivers do
    # get '/trips', to: 'trips#index'
  end

  resources :passengers do
    post '/new_trip', to: 'trips#create'
  end

  resources :trips
  # get '/', to: 'main#index' 
end
