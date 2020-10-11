class Workouts::SummaryComponent < ApplicationComponent
  with_collection_parameter :workout

  def initialize(workout:)
    @workout = workout
    @start_time = workout.start_time.strftime("%d %b %-l:%M%P")
    @exercises = workout.exercises.order(created_at: :desc)
  end

  private

  attr_reader :workout, :start_time, :exercises

  def workout_duration
  end

  def exercise_detail(exercise)
    sets = exercise.sets
    reps = sets.pluck(:reps).compact.sum

    case exercise.exercisable_type
    when 'CalisthenicsExercise'
      "#{pluralize(sets.count, 'set')}, #{exercise.total_reps} reps"
    when 'ResistanceExercise'
      "#{pluralize(sets.count, 'set')}, #{exercise.exercisable.total_kg}kg"
    when 'CardioExercise'
      total_seconds = exercise.exercisable.total_seconds
      "#{exercise.exercisable.total_km}km in #{TimeFormatter.in_hours_minutes_seconds(total_seconds)}"
    end
  end

  def total_distance
    return if workout.cardio_exercises.blank?

    distances = workout.exercises.flat_map(&:exercise_sets).pluck(:distance).compact
    return if distances.blank?

    total = distances .map { |d| BigDecimal(d, 2) }
                      .sum

    "#{total}km"
  end

  def total_weight
    sets = ExerciseSet.joins(exercise: :workout).merge(Workout.where(id: workout.id))
    return if sets.empty? || workout.resistance_exercises.blank?

    weight = sets.pluck(:weight, :reps)
    content_tag(:p, "548 kg", class: 'mr-2')
  end

  def total_sets
    sets = ExerciseSet.joins(exercise: :workout).merge(Workout.where(id: workout.id))
    return if sets.empty?

    content_tag(:p, "#{sets.count} sets")
  end
end
