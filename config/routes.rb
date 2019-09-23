Rails.application.routes.draw do
  root 'home#index'
  get '/translations/', to: 'translate#index'
end
