Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
  resources :products, except: [:update, :edit]
  resource :cart, only: [:show] do
    member do
      post 'additem'
      post 'edititem'
      post 'removeitem'
    end
  end
end
