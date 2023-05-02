Rails.application.routes.draw do
  resources :user
  root "splash#index"
end
