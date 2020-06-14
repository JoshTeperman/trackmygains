Rails.application.routes.draw do
  resources :workouts, only: [:new, :create, :show, :edit, :update] do
    scope module: :workouts do
      resources :exercises, only: [:new, :create]
    end
  end
  root to: 'workouts#new'
end
