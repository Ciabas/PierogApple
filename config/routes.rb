Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]
  resources :products, except: [:update, :edit]
end
