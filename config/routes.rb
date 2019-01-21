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

# post 'public/products/index' => 'public/product#set_select' ,as: 'select'
#???

  namespace :admin do
    resources :users
  end
  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    resources :selects, only: [:create, :update, :destory]
  end

get '/products/search' => 'products#search', as: 'search_products'

  namespace :admin do
    resources :products, only: [:new, :create, :update, :destory, :index, :edit]
    end

    get '/products/check/:id' => 'products#check', as: 'check_product'
    resources :products do
        resources :discs, only: [:new, :create] do
          resources :songs, only: [:new, :create, :edit, :update]
  end
end





  scope module: :public do
    get '/products/search' => 'products#search', as: 'search_products'
    resources :products, only: [:show]

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
