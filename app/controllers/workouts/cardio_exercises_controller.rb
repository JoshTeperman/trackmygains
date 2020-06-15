module Workouts
  class CardioExercisesController < Workouts::MainController
    def show
      @exercise = @workout.cardio_exercises.find_by(id: params[:id])
    end
  end
end
