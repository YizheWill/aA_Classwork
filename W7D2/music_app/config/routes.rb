# frozen_string_literal: true

# class Routes documentation
Rails.application.routes.draw do
  resources :bands
  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
