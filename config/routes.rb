Rails.application.routes.draw do
  
  root 'products#index'
  devise_for :users
  resources :profiles, except:  [:index, :destroy]
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  scope '/cart' do 
    post '/edititem', to: 'carts#edititem', as: :edititem
    post '/removeitem', to: 'carts#removeitem', as: :removeitem
    post '/additem', to: 'carts#additem', as: :additem
    post '/addoneitem', to: 'carts#addoneitem', as: :addoneitem
  end
  resources :orders, only: [:new, :create] do
    member{ get :success }
  end

  scope '/static_pages' do 
    get '/about', to: 'static_pages#about', as: :about
    get '/contact', to: 'static_pages#contact', as: :contact
    get '/rules', to: 'static_pages#rules', as: :rules
  end

  namespace :admin do
    root 'admin#index'
    resources :profiles, only: [:show, :index, :destroy]
    resources :categories, only: [:index, :new, :destroy, :create]
    resources :products, except: [:destroy]
    resources :gears, except: [:show]
    resources :slider_images, only: [:index, :new, :create, :destroy]
    get '/modelindex', to: 'gears#modelindex', as: :modelindex
    get '/new_model', to: 'gears#new_model', as: :gears_new_model
    post '/new_model', to: 'gears#create', as: :gears_create_model
    resources :orders, only: [:show, :index]
    resources :invoices, only: [:show]
  end

  resources :invoices, only: :show
  
end
