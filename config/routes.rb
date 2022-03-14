Rails.application.routes.draw do
  root 'books#index'
  # User routes
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  post '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  # Book routes
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show'
  patch '/books/:id', to: 'books#update'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
