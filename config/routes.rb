Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  namespace :admin do
     resources :orders do
       member do
         post :cancel
         post :ship
         post :shipped
         post :return
       end
     end
    resources :products do
      member do
        post :move_up
        post :move_down
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
    collection do
      get :search
    end 
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
   resources :orders
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
