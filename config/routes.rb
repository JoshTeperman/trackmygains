Rails.application.routes.draw do
  namespace :workouts do
    get 'resistance_exercises/index'
    get 'resistance_exercises/show'
  end
  resources :workouts, only: [:new, :create, :show, :edit, :update] do
    scope module: :workouts do
      resources :cardio_exercises, only: [:index, :show]
      resources :resistance_exercises, only: [:index, :show]
    end
  end
  root to: 'workouts#new'
end
