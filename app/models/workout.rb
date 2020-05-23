class Workout < ApplicationRecord
  before_create :set_default_start_time

  validates :state, presence: true, inclusion: { in: ['started', 'completed', 'deleted'] }
  validate :finish_time_is_after_start_time, if: -> { finish_time.present? }

  enum state: {
    started: 'started',
    completed: 'completed',
    deleted: 'deleted'
  }

  private

  def finish_time_is_after_start_time
    errors.add(:finish_time, 'should be after start time') if finish_time <= start_time
  end

  def set_default_start_time
    self.start_time = Time.current unless start_time.present?
  end
end
