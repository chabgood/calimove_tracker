Rails.application.routes.draw do
  draw :madmin
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :schedules
  resource :session
  resources :passwords, param: :token
  resources :schedules, only: [ :new, :create, :show, :index ]
  resources :weeks, only: [ :show, :index ]
  resources :days, only: [ :show, :index ]
  resources :exercises, only: [ :update ]
  resources :day_names
  resources :set_trackers

  patch 'update_notes', to: 'exercises#update_notes'
  post "create_schedule_upload", to: "schedules#create_upload"
  get "new_schedule_upload", to: "schedules#new_upload"

  get "up" => "rails/health#show", as: :rails_health_check
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  root "schedules#index"
end
