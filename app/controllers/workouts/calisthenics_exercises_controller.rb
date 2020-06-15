module Workouts
  class CalisthenicsExercisesController < Workouts::MainController
    def show
      @exercise = @workout.calisthenics_exercises.find_by(id: params[:id])
      @exercise_type = @exercise.exercise_type
    end
  end
end
