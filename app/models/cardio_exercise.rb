class CardioExercise < ApplicationRecord
  include Exercisable

  has_and_belongs_to_many :workouts
end
