Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drivers do
    # get '/trips', to: 'trips#index'
  end

  resources :passengers
  resources :trips

  get '/', to: 'main#index'
end
