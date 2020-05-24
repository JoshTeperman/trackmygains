module Exercisable
  extend ActiveSupport::Concern

  included do
    has_many :exercises, as: :exercisable
  end
end
