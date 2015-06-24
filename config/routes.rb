Rails.application.routes.draw do

  namespace :admin do
    #resources :users
    #resources :products
    #resources :categories
    #resources :userprofiles
    #resources :gears
  end

  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]

end
