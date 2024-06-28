Rails.application.routes.draw do
    root 'products#index'
  
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
  
    get '/register', to: 'users#new'
    post '/register', to: 'users#create'
  
    resources :products
    resources :orders, only: [:create]
  
    get '/my_products', to: 'products#my_products', as: 'my_products'
end
  