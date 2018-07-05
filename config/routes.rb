# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'statics#index'
  get 'index.html', to: redirect('/') # Fix links and remove this line
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'faq.html', to: 'statics#faq'
  get 'how-it-works.html', to: 'statics#how_it_works'
  get 'terms', to: 'statics#terms'
  get 'privacy.html', to: 'statics#privacy'
  get 'login-signup.html', to: 'users#new', as: :login
  resources :users, only: [:create]
  resources :cart_items, only: %i[index create update destroy] do
    post :checkout, on: :collection
    get :thank_you, on: :collection
  end
  resource :profile, only: %i[show update]

  get 'fetch-product', to: 'products#fetch'

  resources :orders

  namespace :admin do
    root to: redirect('admin/orders')
    resources :users
    resources :orders
    resources :coupons
  end
end
