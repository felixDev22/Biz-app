Rails.application.routes.draw do
  devise_for :users
  resources :user
  resources :categories
  resources :transactions
  root "splash#index"
end
