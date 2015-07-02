Rails.application.routes.draw do

  namespace :admin do
    resources :profiles, only: [:show, :index, :destroy]
    resources :categories, only: [:index, :new, :destroy, :create]
    resources :products, except: [:destroy]
    resources :gears, except: [:show]
    get '/modelindex', to: 'gears#modelindex', as: :modelindex
    get '/new_model' => 'gears#new_model'
    post '/new_model' => 'gears#create'
    root 'admin#index'
    #resources :orders
  end

  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  post '/cart/edititem', to: 'carts#edititem', as: :edititem
  post '/cart/removeitem', to: 'carts#removeitem', as: :removeitem
  post '/cart/additem', to: 'carts#additem', as: :additem

  get 'static_pages/about', to: 'static_pages#about', as: :about
  get 'static_pages/contact', to: 'static_pages#contact', as: :contact
  get 'static_pages/rules', to: 'static_pages#rules', as: :rules
end
