class ExerciseSet < ApplicationRecord
  belongs_to :exercise

  def duration_in_seconds
    return (Time.current - start_time) if finish_time.blank?
    finish_time - start_time
  end
end
