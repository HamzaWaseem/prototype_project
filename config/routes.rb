Rails.application.routes.draw do
  
  resources :notifications
  resources :dashboards
  resources :forms do
    collection do
        get :critical_forms
        get :high_forms
        get :medium_forms
        get :low_forms
        get :department_a_forms
        get :department_b_forms
        get :department_c_forms
    end
  end

  root 'forms#index'
  
  devise_for :users
  resources :users
  resources :roles

  end