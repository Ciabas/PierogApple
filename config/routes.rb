Rails.application.routes.draw do

  namespace :admin do
    resources :profiles, only: [:show, :index]
    resources :categories, only: [:index, :new, :destroy, :create]
    resources :products
    resources :gears
    get '/modelindex' => 'gears#modelindex'
    root 'admin#admin'
    #resources :users
    #resources :products
    #resources :categories
    #resources :gears
    #resources :orders
  end

  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, only: [:show, :index]
end
