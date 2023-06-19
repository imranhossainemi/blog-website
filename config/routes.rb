Rails.application.routes.draw do
  root 'users#index'

  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"
  get "/users", to: "users#index"
  get "users/:id", to: "users#show"
  
end
