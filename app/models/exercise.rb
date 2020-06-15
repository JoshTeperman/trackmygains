class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise_type
  belongs_to :exercisable, polymorphic: true

  CLASS_NAMES = {
    'resistance' => 'ResistanceExercise',
    'calisthenics' => 'CalisthenicsExercise',
    'cardio' => 'CardioExercise'
  }.freeze
end
