Rails.application.routes.draw do
  root to: 'static#home'

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get '/auth/facebook/callback' => 'sessions#facebook'

  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :food_banks do
    resources :orders_as_admin, only: [:index, :new, :create]
  end

  resources :orders_as_admin

  resources :users, only: [] do
    resources :orders
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
