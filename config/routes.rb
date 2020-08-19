Rails.application.routes.draw do
  root to: 'static#home'
  resources :food_banks
  resources :orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
