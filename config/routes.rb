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
    resources :users do
      resources :addresses
    end
  end
  scope module: :public do
      resources :users, only: [:show, :edit, :update, :create] do
        resources :addresses
    end
end

  namespace :admin do
    resources :products do
        resources :discs, only: [:new, :create, :edit, :update, :destroy] do
          resources :songs, only: [:new, :create, :edit, :update, :destroy]
        end
    end
  end

  scope module: :public do
    get '/products/search' => 'products#search', as: 'search_products'
    resources :products
    resources :selects, only: [:create, :update, :destroy]
    get 'select/edit'
    post 'select/edit'
  end

  scope module: :public do
    get '/carts/:id/check' => 'carts#check', as: 'check_cart'
    resources :carts do
    resources :users, only: [:show] do
    resources :addresses, only: [:show]
  end
  end
  end

  scope module: :public do
  post '/add_item' => 'selects#add_item', as: 'carts_products'
  post '/update_item' => 'selects#update_item', as: 'carts_update_item'
  delete '/delete_item' => 'selects#delete_item', as: 'carts_delete_item'
 end

  namespace :admin do
    resources :carts, only: [:show]
  end


  namespace :admin do
    resources :orders
  end

  scope module: :public do
    resources :orders, only: [:create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
