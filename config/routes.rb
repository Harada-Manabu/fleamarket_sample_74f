Rails.application.routes.draw do
  devise_for :users
  root 'goods#index'
  resources :goods, except: :index do
    resources :purchases, only: :index
  end
  resources :users, only: :show
end
