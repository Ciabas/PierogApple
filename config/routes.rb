Rails.application.routes.draw do

  root 'things#index'
  resources :things, only: :index
  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]

end
