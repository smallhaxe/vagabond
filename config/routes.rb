Rails.application.routes.draw do
  
<<<<<<< HEAD
 root to: "welcome#index"

  get "/welcome", to: "welcome#index"
=======
  root to: "welcome#index"
  
  resources :posts
  
  resources :users, except: [:new]
  get "/sign_up", to: "user#new"
  
  resources :places
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  
>>>>>>> 6ea2aa9bdf39529a3113ddb80195bd04c5d48450
end
