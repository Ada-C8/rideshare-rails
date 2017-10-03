Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :drivers, :passengers, :trips

delete "/drivers/:id", to: "jobs#delete", as: "delete_job"
end
