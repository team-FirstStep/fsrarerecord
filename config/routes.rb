Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  root 'public/products#index'

  namespace :admin do
    resources :users
  end
  scope module: :public do
    resources :users, only: [:show, :edit, :update]
  end

  namespace :admin do
    get '/products/search' => 'products#search', as: 'search_products'
    resources :products
      get '/products/check/:id' => 'products#check', as: 'check_product'
  end
  scope module: :public do
    get '/products/search' => 'products#search', as: 'search_products'
    resources :products, only: [:show]

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



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
