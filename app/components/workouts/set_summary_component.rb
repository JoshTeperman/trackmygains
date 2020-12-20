class Workouts::SetSummaryComponent < ApplicationComponent
  def initialize(exercise:, weight: nil, distance: nil, duration: nil, reps:, count:)
    @exercise = exercise
    @weight = weight
    @distance = distance
    @duration = duration
    @reps = reps
    @count = count
    @category = exercise.category
    @unit = set_unit
  end

  private

  attr_reader :exercise, :weight, :distance, :duration, :reps, :count, :category, :unit

  def main_content
    classes = cardio? ? 'text-2xl' : 'text-3xl'
    content = content_tag(:span, "#{key_metric}", class: classes)
    content.concat(content_tag(:span, unit)) if unit.present?
    content
  end

  def num_sets_and_reps
    return if cardio?
    if resistance?
      content_tag(:span, "#{count} x #{reps}", class: 'text-xs uppercase')
    elsif calisthenics?
      content_tag(:span, "#{pluralize(count, 'set')}", class: 'text-xs uppercase')
    end
  end

  def set_unit
    'kg' if resistance?
  end

  def key_metric
    return weight if resistance?
    return "#{distance}km in #{duration} seconds" if cardio?
    reps
  end

  def resistance?
    category == 'resistance'
  end

  def cardio?
    category == 'cardio'
  end

  def calisthenics?
    category == 'calisthenics'
  end
end
