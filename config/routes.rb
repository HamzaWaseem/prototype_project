Rails.application.routes.draw do
  
  resources :notifications
  resources :dashboards
  resources :forms

  root 'forms#index'
  
  devise_for :users
  resources :users
  resources :roles

  end