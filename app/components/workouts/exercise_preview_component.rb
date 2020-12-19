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

    def sets_data
      exercise.sets.order(:weight, :reps)
        .pluck(:weight, :reps)
        .group_by(&:itself)
        .map do |weight_and_reps, instances|
          weight, reps = weight_and_reps.first, weight_and_reps.last,
          count = instances.count
          {
            weight: weight,
            reps: reps,
            count: count
          }
        end
    end

    attr_reader :name, :workout, :exercise, :sets
  end
end
