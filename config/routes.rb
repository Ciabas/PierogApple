Rails.application.routes.draw do

  namespace :admin do
    resources :profiles, only: [:show, :index]
    #resources :users
    #resources :products
    #resources :categories
    #resources :gears
    #resources :orders
  end

  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]

end
