class CardioExercise < ApplicationRecord
  include Exercisable

  before_create :set_start_time

  has_one :exercise_type, through: :exercise

  private

  def set_start_time
    self.start_time ||= Time.current
  end
end
