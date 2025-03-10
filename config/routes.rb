Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :schedules, only: [ :new, :create, :show, :index ]
  resources :weeks, only: [ :show, :index ]
  resources :days, only: [ :show, :index ]
  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  patch "update_rest_time", to: "exercises#update_rest_time"
  patch "update_test_result", to: "exercises#update_test_result"
  root "schedules#index"
end
