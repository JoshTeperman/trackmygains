Rails.application.routes.draw do
  resources :workouts do
    scope module: :workouts do
      resources :exercises, only: [:new, :create, :show, :edit]
    end
  end

  resources :exercise_types, only: [:new, :create]

  get '/activity', to: 'workouts#index'
  root to: 'workouts#index'
end
