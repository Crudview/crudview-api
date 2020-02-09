Rails.application.routes.draw do
  get 'auth/login'
  get 'auth/persist'
  resources :reviews, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update]
  resources :restaurants, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
