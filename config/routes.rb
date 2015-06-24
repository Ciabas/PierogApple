Rails.application.routes.draw do

  root 'things#index'
  resources :things, only: :index
  devise_for :users
  resources :profiles, except:  [:index, :destroy]

end
