Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'drivers/index'
  
  resources :trips
  resources :drivers
  resources :passengers

  root 'welcome#index'

end
