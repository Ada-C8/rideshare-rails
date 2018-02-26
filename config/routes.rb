Rails.application.routes.draw do
resources :drivers
resources :passengers
resources :trips
root  'welcome#index'
end
