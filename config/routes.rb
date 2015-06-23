Rails.application.routes.draw do
  root 'products#index'
  resources :products, except: [:update, :edit]
end
