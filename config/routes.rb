Rails.application.routes.draw do
  get 'users/update'
  get 'pages/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get 'pages/about'

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
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
resources :users, only: [:update]
end
