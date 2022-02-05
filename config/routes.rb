Rails.application.routes.draw do
  # For details on the Domain Specific Language available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#index'
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show'
  patch '/books/:id', to: 'books#update'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
