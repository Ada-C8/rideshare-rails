Rails.application.routes.draw do

  resources :drivers
  resources :trips, except: [:index, :new]

  root "main#index"

  resources :passengers  do
    resources :trips, only: [:new]
  end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
