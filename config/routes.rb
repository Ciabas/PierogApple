Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, except: [:update, :edit]
end
