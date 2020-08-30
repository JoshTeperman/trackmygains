module Workouts
  class ExercisePreviewComponent < ApplicationComponent
    include ApplicationHelper

    def initialize(exercise:, workout:)
      @exercise = exercise
      @workout = workout
      @sets = exercise.sets
      @name = exercise.exercise_type.name
      @path = set_path
    end

    private

    def set_path
      case exercise.exercisable_type
      when 'ResistanceExercise'
        Rails.application.routes.url_helpers.workout_resistance_exercise_path(workout, exercise.exercisable_id)
      when 'CardioExercise'
        Rails.application.routes.url_helpers.workout_cardio_exercise_path(workout, exercise.exercisable_id)
      when 'CalisthenicsExercise'
        Rails.application.routes.url_helpers.workout_calisthenics_exercise_path(workout, exercise.exercisable_id)
      end
    end

    attr_reader :name, :path, :workout, :exercise, :sets
  end
end
