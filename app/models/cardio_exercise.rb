class CardioExercise < ApplicationRecord
  include Exercisable

  def total_km
    sets.pluck(:distance, :reps)
        .compact
        .map { |distance, reps| distance * reps }
        .sum
  end

  def total_seconds
    sets.pluck(:start_time, :finish_time)
        .compact
        .map { |start_time, finish_time| finish_time - start_time }
        .sum
        .seconds.to_i
  end
end


