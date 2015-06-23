Rails.application.routes.draw do
  devise_for :users
  resources :profiles, except:  [:index, :destroy]
end
