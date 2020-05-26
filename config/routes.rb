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
    collection do
      get 'categoryChildren'
      get 'categoryGrandChildren'
    end
    member do
      get 'categoryChildren'
      get 'categoryGrandChildren'
    end
    resources :purchases, only: :index do
      member do
        post 'pay'
        get 'done'
      end
    end
  end
  resources :users, only: :show do
    get 'logout' => "users#logout"
  end
  resources :credit_cards, only: [:new, :create, :show, :destroy]
end