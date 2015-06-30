Rails.application.routes.draw do

  resources :invoices, only: :index

  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, except: [:update, :edit]
  resource :cart, only: [:show]
  post '/cart/edititem', to: 'carts#edititem', as: :edititem
  post '/cart/removeitem', to: 'carts#removeitem', as: :removeitem
  post '/cart/additem', to: 'carts#additem', as: :additem
end
