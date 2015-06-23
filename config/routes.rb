Rails.application.routes.draw do
  resources :cases

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
