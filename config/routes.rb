Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :translations
  resources :sessions, only: [:new,:create,:destroy]

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
end
