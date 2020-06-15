Rails.application.routes.draw do
  resources :workouts, only: [:new, :create, :show, :edit, :update] do
    scope module: :workouts do
      resources :exercises, only: [:new, :create, :show]
      resources :cardio_exercises, only: [:show]
      resources :resistance_exercises, only: [:show]
      resources :calisthenics_exercises, only: [:show]
    end
  end
  root to: 'workouts#new'
end
