Rails.application.routes.draw do
  resources :workouts do
    scope module: :workouts do
      resources :exercises
    end
  end
end
