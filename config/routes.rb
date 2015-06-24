Rails.application.routes.draw do

  resources :things, only: :index
  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]

end
