Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
  resources :goodranking, only: :index
  
end
