Rails.application.routes.draw do
  
  resources :forms

  root 'forms#index'
  
  devise_for :users
  resources :users
  resources :roles

  end