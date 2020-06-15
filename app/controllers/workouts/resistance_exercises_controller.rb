module Workouts
  class ResistanceExercisesController < Workouts::MainController
    def show
      @exercise = @workout.resistance_exercises.find_by(id: params[:id])
      @exercise_type = @exercise.exercise_type
    end
  end
end
