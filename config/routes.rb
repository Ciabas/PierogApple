Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, except: [:update, :edit]
  resource :cart, only: [:show, :destroy] do
    member do
      post 'additem'
    end
  end
end
