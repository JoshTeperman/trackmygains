class CardioExercise < ApplicationRecord
  include Exercisable

  before_create :set_start_time

  def duration_in_seconds
    return (Time.current - start_time) if finish_time.blank?

    finish_time - start_time
  end

  private

  def set_start_time
    self.start_time ||= Time.current
  end
end
