module Workouts
  class ExercisePreviewComponent < ApplicationComponent
    include ApplicationHelper

    with_collection_parameter :exercise

    def initialize(exercise:, workout:)
      @workout = workout
      @exercise = exercise
      @sets = exercise.sets
      @name = exercise.exercise_type.name
    end

    private

    attr_reader :name, :workout, :exercise, :sets
  end
end
