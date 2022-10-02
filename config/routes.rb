Rails.application.routes.draw do




  root :to => 'public/homes#top'
  get '/about' => 'public/homes#about'


  get 'customers/information/edit', to: 'public/information#edit'



#顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :products, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end




    scope module: :public do
    get 'orders/complete'
    delete '/cart_items/destroy_all'
    resources :items, only: [:show, :index]
    resources :homes
    resources :information, only: [:edit, :update]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    get "customers/mypage"
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    post 'orders/confirm'

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
