Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }
  resources :profiles, except:  [:index, :destroy]
end
