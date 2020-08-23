Rails.application.routes.draw do
  resources :workouts do
    scope module: :workouts do
      resources :exercises, only: [:new, :create, :show]
      resources :cardio_exercises, only: [:show]
      resources :resistance_exercises, only: [:show]
      resources :calisthenics_exercises, only: [:show]
    end
  end

  resources :exercise_types, only: [:new, :create]

  get '/activity', to: 'workouts#index'
  root to: 'workouts#index'
end
