# Below are the routes for madmin
namespace :madmin do
  resources :week_statuses
  resources :workout_names
  resources :schedules
  resources :sessions
  resources :users
  resources :weeks
  resources :exercise_statuses
  resources :levels
  resources :phases
  resources :days
  resources :day_names
  resources :exercises
  root to: "dashboard#show"
end
