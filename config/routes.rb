Rails.application.routes.draw do
  

 root to: "welcome#index"

  get "/welcome", to: "welcome#index"

  
  resources :posts
  
  resources :users, except: [:new]
  get "/sign_up", to: "users#new", as: "new_user"
  
  resources :places
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

end

