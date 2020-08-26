class CardioExercise < ApplicationRecord
  include Exercisable

  before_create :set_start_time

  private

  def set_start_time
    self.start_time ||= Time.current
  end
end
