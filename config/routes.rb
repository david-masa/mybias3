Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :update, :destroy]
  resources :kpop, only: :index
  resources :jpop, only: :index
  resources :thaipop, only: :index
  resources :chinesepop, only: :index
  
end
