Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'identification', to: 'users/registrations#new_identification'
    post 'identifications', to: 'users/registrations#create_identification'
  end
  
  root 'goods#index'
  resources :goods
  resources :users, only: :show
end
