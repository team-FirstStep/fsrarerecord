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
      resources :users, only: [:show, :edit, :update, :create] do
    end
end

  namespace :admin do
    get '/products/check/:id' => 'products#check', as: 'check_product'
    resources :products do
        resources :discs, only: [:new, :create, :edit, :update] do
          resources :songs, only: [:new, :create, :edit, :update]
        end
    end
  end

  scope module: :public do
    get '/products/search' => 'products#search', as: 'search_products'
    resources :products
    resources :selects, only: [:create, :update, :destory]
  end

  scope module: :public do
    resources :carts
  end

  scope module: :public do
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
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
