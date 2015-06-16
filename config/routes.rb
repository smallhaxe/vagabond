Rails.application.routes.draw do
  
  root to: "welcome#index"
  
  resources :posts
  
  resources :users, except: [:new]
  get "/sign_up", to: "welcome#index", as: "new_user"
  post "/users", to: "users#create"
  
  resources :places
  
  get "/login", to: "sessions#new" # update to welcome#index ??
  post "/sessions", to: "sessions#create"

end
