class ExerciseType < ApplicationRecord
  has_many :exercises

  enum category: {
    'calisthenics': 'calisthenics',
    'cardio': 'cardio',
    'resistance': 'resistance'
  }
end
