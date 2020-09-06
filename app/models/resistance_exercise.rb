class ResistanceExercise < ApplicationRecord
  include Exercisable

  def total_kg
    sets.pluck(:weight, :reps)
        .compact
        .map { |weight, reps| weight * reps }
        .sum
  end
end
