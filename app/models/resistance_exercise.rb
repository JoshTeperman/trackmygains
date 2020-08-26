class ResistanceExercise < ApplicationRecord
  include Exercisable

  has_one :exercise_type, through: :exercise
  has_many :exercise_sets, through: :exercise
end
