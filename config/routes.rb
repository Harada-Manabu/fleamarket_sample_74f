Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'identifications', to: 'users/registrations#new_identification'
    post 'identifications', to: 'users/registrations#create_identification'
    get 'deliveryAddresses', to: 'users/registrations#new_deliveryAddress'
    post 'deliveryAddresses', to: 'users/registrations#create_deliveryAddress'
  end

  root 'goods#index'
  resources :goods, except: :index do
    resources :purchases, only: :index
  end
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :show, :destroy]
end