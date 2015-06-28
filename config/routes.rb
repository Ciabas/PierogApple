Rails.application.routes.draw do

  namespace :admin do
    resources :profiles, only: [:show, :index]
    resources :categories, only: [:index, :new]
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
  resources :products, except: [:update, :edit]
end
