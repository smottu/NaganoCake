Rails.application.routes.draw do


  root :to => 'public/homes#top'
  get '/about' => 'homes#about'

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :products, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end


  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  devise_for :admins, path: 'admin'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
