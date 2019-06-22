# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # jsonapi resource routes
  # 
  # Only the actions that we are planning to use are exposed.
  jsonapi_resources :e_consults, only: [:index, :show]
  jsonapi_resources :attachments, only: [:index, :show, :update]
  jsonapi_resources :redactions, only: [ :create, :update, :delete]
end
