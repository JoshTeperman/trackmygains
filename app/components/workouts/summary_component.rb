class Workouts::SummaryComponent < ApplicationComponent
  with_collection_parameter :workout

  def initialize(workout:)
    @workout = workout
    @start_time = workout.start_time.strftime("%d %b %-l:%M%P")
    @exercises = workout.exercises.order(created_at: :desc)
  end

  private

  attr_reader :workout, :start_time, :exercises

  def duration
    finish_time = workout.finish_time || Time.current
    seconds = finish_time - workout.start_time
    minutes = (seconds / 60).to_i
    "#{minutes} minutes"
  end

  def exercise_detail(exercise)
    case exercise.exercisable_type
    when 'CalisthenicsExercise'
      '5 sets, 100 reps'
    when 'ResistanceExercise'
      '5 sets, 75kg max'
    when 'CardioExercise'
      "2km in 10'12\""
    end
  end

  def total_distance
    return if workout.cardio_exercises.blank?

    distances = workout.cardio_exercises.pluck(:distance).compact
    return if distances.blank?

    total = distances .map { |d| BigDecimal(d, 2) }
                      .reduce(:+)

    "#{total}km"
  end

  def total_weight
    return if workout.resistance_exercises.blank?

    '843kg'
  end

  def total_sets
    '15 sets'
  end
end
