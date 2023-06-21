Rails.application.routes.draw do
  root 'users#index'

  get "/users/:id/posts", to: "posts#index", as: 'posts'
  get "/users/:id/posts/:id", to: "posts#show", as: 'post'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: 'user'
    
end
