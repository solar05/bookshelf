# frozen_string_literal: true

Rails.application.routes.draw do
  delete 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  resources :books
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  root to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
