class Workouts::SetSummaryComponent < ApplicationComponent
  with_collection_parameter :set

  def initialize(set:)
    @set = set
    @weight = set.weight
  end

  private

  attr_reader :set, :weight

  def sets_and_reps
    "15 x 5 sets"
  end
end
