module Workouts
  class CardioExercisesController < Workouts::MainController
    before_action :set_workout

    def index
      @exercises = @workout.cardio_exercises
    end

    def show
      @exercise = CardioExercise.find_by(id: params[:id])
    end

    private

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end
  end
end
