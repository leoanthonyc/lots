Rails.application.routes.draw do
  root to: 'items#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :items
end
