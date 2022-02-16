Rails.application.routes.draw do
  root 'books#index'
  get '/signup', to: 'users#new'
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show'
  patch '/books/:id', to: 'books#update'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
