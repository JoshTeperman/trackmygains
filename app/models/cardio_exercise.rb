class CardioExercise < ApplicationRecord
  include Exercisable

  belongs_to :exercise_type
end
