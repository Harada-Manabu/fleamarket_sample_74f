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
  resources :goods
  resources :users, only: :show
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
