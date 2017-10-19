Rails.application.routes.draw do

   root 'main#index'
   resources :drivers
   resources :passengers
   resources :trips


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
