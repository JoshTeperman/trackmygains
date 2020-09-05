class Workouts::SetSummaryComponent < ApplicationComponent
  with_collection_parameter :set

  def initialize(set:, exercise:)
    @set = set
    @exercise = exercise
    @exercise_type = exercise.exercisable_type
  end

  private

  attr_reader :set, :exercise, :exercise_type

  def main_metric
    metric = set.weight if exercise_type == 'ResistanceExercise'
    metric = set.reps if exercise_type == 'CalisthenicsExercise'
    metric = set.distance if exercise_type == 'CardioExercise'

    content = content_tag(:span, metric, class: 'text-3xl')

    content.concat(content_tag(:span, "kg")) if exercise_type == 'ResistanceExercise'
    content.concat(content_tag(:span, "km")) if exercise_type == 'CardioExercise'

    content
  end

  def sub_metric
    content = sets_and_reps
    content_tag(:span, content, class: 'text-xs uppercase')
  end

  def sets_and_reps
    "15 x 5 sets"
  end
end
