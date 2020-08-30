class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise_type
  belongs_to :exercisable, polymorphic: true
  has_many :exercise_sets

  delegate :name, to: :exercise_type
  alias :sets :exercise_sets

  CLASS_NAMES = {
    'resistance' => 'ResistanceExercise',
    'calisthenics' => 'CalisthenicsExercise',
    'cardio' => 'CardioExercise'
  }.freeze
end
