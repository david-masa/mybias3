Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :destroy]
  resources :kpop, only: :index
  resources :jpop, only: :index
  resources :thaipop, only: :index
  resources :chinesepop, only: :index
  resources :indianpop, only: :index
  resources :russianpop, only: :index
  
end
