Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #RIDERS
  get 'riders', to: 'riders#index', as: 'riders' #riders_path

  get 'riders/:id/edit', to: 'riders#edit', as: 'edit_rider' #edit_rider_path

  get 'riders/new', to: 'riders#new', as: 'new_rider' #new_rider_path

  get 'riders/:id', to: 'riders#show', as: 'rider' #rider_path

  patch 'riders/:id', to: 'riders#update', as: 'update_rider' #update_rider_path

  post 'riders', to: 'riders#create', as: 'create_rider' #create_rider_path

  delete 'riders/:id', to: 'riders#destroy', as: 'delete_rider' #delete_rider_path

end
