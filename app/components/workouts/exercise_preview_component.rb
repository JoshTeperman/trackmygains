module Workouts
  class ExercisePreviewComponent < ApplicationComponent
    include ApplicationHelper

    with_collection_parameter :exercise

    def initialize(exercise:, workout:)
      @workout = workout
      @exercise = exercise
      @sets = exercise.sets
      @name = exercise.name
      @category = exercise.category
    end

    private

    def sets_data
      case category
      when 'resistance'
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
      when 'calisthenics'
        exercise.sets.order(:reps)
          .pluck(:reps)
          .group_by(&:itself)
          .to_h { |k, v| [k, v.count] }
          .map { |reps, count| {reps: reps, count: count} }
      when 'cardio'
        exercise.sets.map do |set|
          {
            distance: set.distance,
            duration: set.duration_in_seconds,
            reps: 1,
            count: 1
          }
        end
      end
    end

    def exercise_path
      workout_exercise_path(workout, exercise.exercisable_id)
    end

    attr_reader :name, :workout, :exercise, :sets, :category
  end
end
