Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comment, only: :create
  end
  resources :users, only: [:edit, :update, :destroy]
end
