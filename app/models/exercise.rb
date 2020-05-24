class Exercise < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
end
