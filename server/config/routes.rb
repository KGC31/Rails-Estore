Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # User & Authentication Routes
      resources :users, only: [:show, :update, :destroy] do
        resources :addresses, only: [:index, :create, :update, :destroy]
        resources :carts, only: [:index, :create] do
          resources :cart_items, only: [:create, :update, :destroy]
        end
        resources :orders, only: [:index, :create, :show] do
          resources :order_items, only: [:index]
          resources :payments, only: [:create, :show]
        end
      end

      # Authentication routes
      post 'auth/signup', to: 'auth#signup'
      post 'auth/login', to: 'auth#login'

      # Products, Categories, and Brands
      resources :products, only: [:index, :show] do
        resources :reviews, only: [:index, :create]
      end

      resources :categories, only: [:index, :show] do
        resources :products, only: [:index]
      end

      resources :brands, only: [:index, :show] do
        resources :products, only: [:index]
      end
    end
  end
end
