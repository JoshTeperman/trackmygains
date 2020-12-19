class Workouts::SetSummaryComponent < ApplicationComponent
  def initialize(exercise:, weight:, reps:, count:)
    @exercise = exercise
    @weight = weight
    @reps = reps
    @count = count
    @category = exercise.category
  end

  private

  attr_reader :exercise, :weight, :reps, :count, :category

  def main_metric
    content = content_tag(:span, "#{weight}", class: 'text-3xl')

    content.concat(content_tag(:span, "kg")) if category == 'resistance'
    content.concat(content_tag(:span, "km")) if category == 'cardio'

    content
  end

  def sub_metric
    content_tag(:span, "#{count} x #{reps}", class: 'text-xs uppercase')
  end
end
