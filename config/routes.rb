Rails.application.routes.draw do
  devise_for :users
  root 'goods#index'
  resources :goods
  resources :users
end
