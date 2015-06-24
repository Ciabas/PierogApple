Rails.application.routes.draw do

  resources :invoices, only: :index
  devise_for :users
  root 'home#home'
  resources :profiles, except:  [:index, :destroy]

end
