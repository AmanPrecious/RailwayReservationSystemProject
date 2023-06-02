Rails.application.routes.draw do
 
  #resources :payments,only: [:show, :new, :create, :index]
  resources :trains ,only:[:show,:index]
 # resources :tickets,only: [:show, :new, :create, :index]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#index" 
  get '/search', to: "home#search"
  
  resources :tickets do
    resources :payments, :passengers, shallow: true
  end

 

end
