module Workouts
  class ExercisePreviewComponent < ApplicationComponent
    attr_reader :category, :name
    def initialize(exercise:)
      @exercise = exercise
      @exercise_type = exercise.exercise_type
      @name = @exercise_type.name
      @category = @exercise_type.category
    end
  end
end
