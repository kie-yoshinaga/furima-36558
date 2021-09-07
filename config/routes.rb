Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order_histories, only:[:create, :new, :index]
    resources :comments, only: :create
  end
  resources :messages, only: [:create]
end
