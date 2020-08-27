class Workout < ApplicationRecord
  has_many :exercises
  has_many :exercise_types, through: :exercises

  has_many :resistance_exercises, through: :exercises, source: :exercisable, source_type: 'ResistanceExercise'
  has_many :cardio_exercises, through: :exercises, source: :exercisable, source_type: 'CardioExercise'
  has_many :calisthenics_exercises, through: :exercises, source: :exercisable, source_type: 'CalisthenicsExercise'

  validates :state, presence: true, inclusion: { in: ['started', 'completed', 'deleted'] }
  validates :start_time, presence: true
  validate :finish_time_is_after_start_time, if: -> { start_time.present? && finish_time.present? }

  enum state: {
    started: 'started',
    completed: 'completed',
    deleted: 'deleted'
  }

  def duration_in_seconds
    return (Time.current - start_time) if finish_time.nil?

    finish_time - start_time
  end

  private

  def finish_time_is_after_start_time
    errors.add(:finish_time, 'should be after start time') if finish_time <= start_time
  end
end
