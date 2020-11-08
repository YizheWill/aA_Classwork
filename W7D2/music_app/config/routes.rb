Rails.application.routes.draw do
  resources :notes
  resources :tracks do
    resources :notes
  end
  resources :bands do
    resources :albums
  end
  resources :albums do
    resources :tracks
  end
  resources :albums

  resources :users
  resource :session, only: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bands#index'
end
