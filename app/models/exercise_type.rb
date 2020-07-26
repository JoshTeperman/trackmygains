class ExerciseType < ApplicationRecord
  has_many :exercises
  validates :name, uniqueness: { case_sensitive: false }

  enum category: {
    'calisthenics': 'calisthenics',
    'cardio': 'cardio',
    'resistance': 'resistance'
  }
end
