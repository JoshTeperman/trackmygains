class Workouts::SetSummaryComponent < ApplicationComponent
  with_collection_parameter :set

  def initialize(set:, exercise:)
    @set = set
    @exercise = exercise
    @category = exercise.category
  end

  private

  attr_reader :set, :exercise, :category

  def main_metric
    metric = set.weight if category == 'resistance'
    metric = set.reps if category == 'calisthenics'
    metric = set.distance if category == 'cardio'

    content = content_tag(:span, metric, class: 'text-3xl')

    content.concat(content_tag(:span, "kg")) if category == 'resistance'
    content.concat(content_tag(:span, "km")) if category == 'cardio'

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
