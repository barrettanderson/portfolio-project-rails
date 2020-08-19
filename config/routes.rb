Rails.application.routes.draw do
  root to: 'static#home'

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :food_banks
  resources :orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
