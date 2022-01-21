Rails.application.routes.draw do
  # For details on the Domain Specific Language available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :products
  get '/products', to: 'products#index'
  post 'products', to: 'products#create'
  get '/products/:id', to: 'products#show'
end
