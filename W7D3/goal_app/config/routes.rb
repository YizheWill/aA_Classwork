Rails.application.routes.draw do
  resources :comments
  resources :users, only: %i[new create show index]
  resources :goals, only: %i[new create show edit update]
end
