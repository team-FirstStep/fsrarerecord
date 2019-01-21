Rails.application.routes.draw do

# ↓実験台のページ
get 'admin/users' => 'admin/users#index'

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

    resources :users, only: [:show, :edit, :update, :create] do

      resources :addresses, only: [:new, :create, :edit, :update, :index]
  end
  end
      resources :selects, only: [:create, :update, :destory]

  namespace :admin do
    get '/products/check/:id' => 'products#check', as: 'check_product'
    resources :products do
        resources :discs, only: [:new, :create] do
          resources :songs, only: [:new, :create, :edit, :update]
end
end
end

  scope module: :public do
    resources :products
    get '/products/search' => 'products#search', as: 'search_products'
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
