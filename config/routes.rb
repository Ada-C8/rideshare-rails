Rails.application.routes.draw do
  root to: 'rideshare#index'
  get '/rideshare', to: 'rideshare#index', as: 'rideshare_index'
  get '/passengers', to: 'passenger#index', as: 'passenger_index'
end
