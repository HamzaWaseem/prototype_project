Rails.application.routes.draw do
  
  resources :forms
  mount ActionCable.server => '/cable'

  root 'home#index'
  
  devise_for :users
  resources :users
  resources :roles
  
  
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :registrations, only: [] do
        collection do
          post :sign_up
        end
      end
      resources :user_sessions, only: [] do
        collection do
          post :sign_in
          post :logout
        end
      end
      resources :forms, only: [:index, :create] do
        collection do
          get :form_fields
        end
      end
      resources :histories, only: [:index]

      end
    end
  end