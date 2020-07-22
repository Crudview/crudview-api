Rails.application.routes.draw do
  root "homes#index"
  get "/auth", to: "auth#persist"
  post "/login", to: "auth#login"
  resources :users, only: [:index, :show, :create, :update]
  resources :restaurants, only: [:index, :show]
  resources :reviews, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
