Rails.application.routes.draw do
  resources :trains
  resources :passengers
  get 'trains/show'
  resources :tickets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#index" 
  get '/search', to: "home#search"
  
end
