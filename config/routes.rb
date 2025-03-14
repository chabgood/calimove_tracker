Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :schedules, only: [ :new, :create, :show, :index ]
  resources :weeks, only: [ :show, :index ]
  resources :days, only: [ :show, :index ]
  resources :exercises, only: [ :update ]

  get "up" => "rails/health#show", as: :rails_health_check
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  root "schedules#index"
end
