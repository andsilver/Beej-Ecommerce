# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'statics#index'
  get 'index.html', to: redirect('/') # Fix links and remove this line
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'login-signup.html', to: 'users#new', as: :login
  resources :users, only: [:create]
  resources :cart_items, only: %i[index create update destroy] do
    post :checkout, on: :collection
  end
  get 'fetch-product', to: 'products#fetch'

  resources :orders

  namespace :admin do
    resources :orders
  end
end
