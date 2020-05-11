Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'goods#index'
  resources :goods
  resources :users, only: :show
end
