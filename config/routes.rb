Rails.application.routes.draw do
  get 'pages/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

 resources :lists, except: [:index] do
  resources :items, only: [:create, :destroy, :edit, :update]
  resources :user_lists, only: [:create]
  end
  resources :items, only: [:show] do
    member do
       put :update_notification
    end
end
  # resources :items, only: [:show]

  get '/places', to: 'places#call'
end
