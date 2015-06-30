Rails.application.routes.draw do

  namespace :admin do
    resources :profiles, only: [:show, :index, :destroy]
    resources :categories, only: [:index, :new, :destroy, :create]
    resources :products
    resources :gears, only: [:index, :new, :create, :destroy]
    get '/modelindex' => 'gears#modelindex'
    get '/new_model' => 'gears#new_model'
    post '/new_model' => 'gears#create_model'
    delete '/modelindex/:id' => 'gears#destroy_model'
    root 'admin#admin'
    #resources :orders
  end

  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, only: [:show, :index]
end
