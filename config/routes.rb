Rails.application.routes.draw do
  resources :cases do
  	  member do
	    post :request_info
	  end
	end
  resources :veterans
  get 'case/test'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :guestbook
  resources :visitors
  post 'visitors/filter'
end
