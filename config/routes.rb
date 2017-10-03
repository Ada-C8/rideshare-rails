Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :drivers
  resources :passengers
   #only: [:index, :new, :create, :show] #no option to delete, edit, don't have extras lying around.
  resources :trips
end
