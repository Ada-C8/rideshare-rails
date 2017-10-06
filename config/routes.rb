Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :passengers do
     resources :trips, only: [:new, :create]
   end
   resources :trips
   resources :drivers
   root 'main#index'

end
