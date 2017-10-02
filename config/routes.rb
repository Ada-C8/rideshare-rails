Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/passengers', to: 'passengers#index'
  
  # get '/pages', to: 'pages#index'
  # #get requests for the pages path should go to the pages controllers index method
  # post 'pages', to: 'pages#create'
  # #post requests for the pages path should go the pages controllers create mthod
  # #the post route takes the form data and sends it to the create method
  # get 'pages/new', to: 'pages#new', as: 'new_page'
  # #get requests for the pages/new path should go the pages controllers new method
  # get 'pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  # #get requests for the pages/:id/edit path should go the pages controllers edit method
  # patch 'pages/:id', to: 'pages#update'
  #
  # get '/pages/:id', to: 'pages#show', as: 'page'
  # #get requests for the /pages/:id path should go the pages controllers show method.
  #
  # delete '/pages/:id', to: 'pages#destroy'
  #deelete requests for the /pages/:id path should go the pages controllers destory method.


end
