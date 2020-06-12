class CalisthenicsExercise < ApplicationRecord
  include Exercisable

  has_one :exercise_type, through: :exercise
end
