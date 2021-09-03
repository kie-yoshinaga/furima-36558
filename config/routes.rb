Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order_histories, only:[:create, :new, :index]
  end
end
