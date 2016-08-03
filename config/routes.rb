Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root to: 'home#index'

  authenticate :user do
    resources :recipes, only: [:new, :create, :edit, :update]
  end
  resources :recipes, only: [:index, :show]

  authenticate :admin do
    resources :cuisines, only: [:new, :create]
    resources :food_types, only: [:new, :create]
  end
  resources :cuisines, only: [:show]
end
