Rails.application.routes.draw do
  devise_for :users

  root 'public/products#index'

  namespace :admin do
    resources :users
  end
  scope module: :public do
    resources :users, only: [:show, :edit, :update]
  end

  namespace :admin do
    resources :products
      get '/products/check/:id' => 'products#check', as: 'check_product'
      get '/products/search' => 'products#search', as: 'search_products'
  end
  scope module: :public do
    resources :products, only: [:show]
      get '/products/search' => 'products#search', as: 'search_products'
  end

  namespace :admin do
    resources :songs
  end

  namespace :admin do
    resources :carts, only: [:show]
  end
  scope module: :public do
    resources :carts
  end

  namespace :admin do
    resources :orders
  end
  scope module: :public do
    resources :orders, only: [:create]
  end


  resources :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
