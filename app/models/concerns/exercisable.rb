module Exercisable
  extend ActiveSupport::Concern

  included do
    has_one :exercise, as: :exercisable
  end
end
