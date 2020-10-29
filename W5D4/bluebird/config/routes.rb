Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #verb 'path' to: 'controller#action' as alias_name
  # get "/chirps", to: "chirps#index"
  # get "/chirps/:id", to: "chirps#show"
  # post "/chirps", to: "chirps#create"
  # patch "/chirps/:id", to: "chirps#update"
  # delete "/chirps/:id", to: "chirps#destroy"
  # resources :chirps, only: [:index, :show, :create, :update, :destroy]
  resources :chirps, except: [:new, :edit]
  get "chirps/haha", to: "chirps#haha"
end
