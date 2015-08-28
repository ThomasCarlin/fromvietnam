Rails.application.routes.draw do
  resources :cases
  resources :veterans
  get 'case/test'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
