# frozen_string_literal: true

Rails.application.routes.draw do
  root 'index#input'

  get 'session/login'
  get 'session/create'
  get 'session/logout'
  get 'session/registrate'
  get 'session/update'
  resources :users
  
  get 'index/output'
  post 'index/add'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
