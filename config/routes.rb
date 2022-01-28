Rails.application.routes.draw do
  # For details on the Domain Specific Language available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :products
  get '/books', to: 'books#index'
  post 'books', to: 'books#create'
  get '/books/:id', to: 'books#show'
end
