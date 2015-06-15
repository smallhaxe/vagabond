Rails.application.routes.draw do
  
  get 'welcome/index'

  root to: "welcome#index"
  
  resources :posts
  
  resources :users, except: [:new]
  get "/sign_up", to: "user#new"
  
  resources :places
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

 resources :posts
 
 resources :users, except: [:new]
 get "/sign_up", to: "user#new"
 
 resources :places
 
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
  
end
