module Exercisable
  extend ActiveSupport::Concern

  included do
    has_one :exercise, as: :exercisable, dependent: :destroy
  end
end
