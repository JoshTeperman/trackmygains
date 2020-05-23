class Workout < ApplicationRecord
  validates :state, presence: true, inclusion: { in: ['started', 'completed', 'deleted'] }
  validates :start_time, presence: true
  validate :finish_time_is_after_start_time, if: -> { start_time.present? && finish_time.present? }

  enum state: {
    started: 'started',
    completed: 'completed',
    deleted: 'deleted'
  }

  private

  def finish_time_is_after_start_time
    errors.add(:finish_time, 'should be after start time') if finish_time <= start_time
  end
end
