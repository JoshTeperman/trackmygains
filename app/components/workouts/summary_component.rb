class Workouts::SummaryComponent < ApplicationComponent
  with_collection_parameter :workout

  def initialize(workout:)
    @workout = workout
    @start_time = workout.start_time.strftime("%d %b %-l:%M%P")
  end

  private

  attr_reader :workout, :start_time

  def duration
    finish_time = workout.finish_time || Time.current
    seconds = finish_time - workout.start_time
    minutes = (seconds / 60).to_i
    "#{minutes} minutes"
  end
end
