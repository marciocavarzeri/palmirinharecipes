Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root to: 'home#index'
  resources :recipes, only: [:index, :show, :new, :create]
  authenticate :admin do
    resources :cuisines, only: [:show, :new, :create]
  end
end
