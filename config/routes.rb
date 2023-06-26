Rails.application.routes.draw do
  root 'users#index'

  get "/users/:id/posts", to: "posts#index", as: 'posts'
  get "/users/:id/posts/new", to: "posts#new", as: 'new_post'
  post "/users/:id/posts", to: "posts#create" 
  get "/users/:user_id/posts/:id", to: "posts#show", as: 'user_post'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: 'user'
  get "/users/:id/posts/:id/comments/new", to: "comments#new", as: 'new_comment'
  post "/users/:id/posts/:id/comments", to: "comments#create", as: 'comments'
  post "/users/:id/posts/:id", to: "likes#create", as: 'likes'
end
