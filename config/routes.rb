Rails.application.routes.draw do
  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]
end
