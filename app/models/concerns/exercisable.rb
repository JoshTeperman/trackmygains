module Exercisable
  extend ActiveSupport::Concern

  included do
    has_one :exercise, as: :exercisable, dependent: :destroy
    has_one :exercise_type, through: :exercise
    has_many :exercise_sets, through: :exercise

    alias :sets :exercise_sets
  end
end
