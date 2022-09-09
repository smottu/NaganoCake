Rails.application.routes.draw do


  namespace :admin do
    get 'oders/index'
    get 'oders/show'
  end
#顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root :to => 'public/homes#top'
  get '/about' => 'homes#about'

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :products, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:new, :create, :index, :show, :edit, :update]
    resources :oders, only: [:index, :show, :update]
  end


  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
