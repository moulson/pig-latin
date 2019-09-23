Rails.application.routes.draw do
  resources :translations
  root 'home#index'
end
