Rails.application.routes.draw do
  namespace :admin do
      resources :doctor_categories
      resources :categories
      resources :appointments
      resources :users
      resources :doctors

      root to: "appointments#index"
    end
  root "home#show"
  # Doctors
  devise_for :doctors, path: 'doctors'
  get '/doctor_profile', to: 'profiles#doctor_profile'
  # Users
  devise_for :users, path: 'users'
  get '/user_profile', to: 'profiles#user_profile'
  # Appointments
  resources :appointments, only: [:new, :create, :show] do
    resources :recommendations, only: [:create]
  end
  # Categories
  resources :categories
end
