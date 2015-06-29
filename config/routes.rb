Rails.application.routes.draw do

  resources :invoices, only: :index
  devise_for :users
  root 'products#index'
  resources :profiles, except:  [:index, :destroy]
<<<<<<< HEAD

=======
  resources :products, except: [:update, :edit]
>>>>>>> master
end
