module Workouts
  class CardioExercisesController < Workouts::MainController
    def show
      @exercise = @workout.cardio_exercises.find_by(id: params[:id])
      @exercise_type = @exercise.exercise_type
    end
  end
end
