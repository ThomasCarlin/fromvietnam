Rails.application.routes.draw do
  resources :people do
  	  member do
	    post :request_info
	  end
	end
  resources :veterans
  get 'case/test'
  get 'about', to: 'visitors#about'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :guestbook
  resources :visitors
  post 'visitors/filter'
end
