Rails.application.routes.draw do
  root 'home#home'
  #root 'products#index'
  resources :products, except: [:update, :edit]

end
