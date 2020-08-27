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
    readable_duration(workout)
  end

  def readable_duration(obj)
    duration = obj.duration_in_seconds
    duration < 1.hour.seconds ? "#{(duration / 60).round} minutes" : duration_in_hours(duration)
  end

  def duration_in_hours(duration)
    hours = (duration / 1.hour.seconds).round
    minutes = ((duration % 1.hour.seconds) / 60.seconds).round

    duration = "#{pluralize(hours, 'hour')}"
    duration.concat(", #{pluralize(minutes, 'minute')}") if minutes.positive?

    duration
  end

  def exercise_detail(exercise)
    case exercise.exercisable_type
    when 'CalisthenicsExercise'
      set_count = exercise.exercise_sets.count
      rep_count = exercise.exercise_sets.pluck(:reps).inject(:+)
      set_count.positive? ? "#{pluralize(set_count, 'set')}, #{rep_count} reps" : 'No sets yet'
    when 'ResistanceExercise'
      set_count = exercise.exercise_sets.count
      max_weight = exercise.exercise_sets.pluck(:weight).max
      set_count.positive? ? "#{pluralize(set_count, 'set')}, max #{max_weight} kg" : 'No sets yet'
    when 'CardioExercise'
      cardio_exercise = CardioExercise.find_by(id: exercise.exercisable_id)
      return "#{exercise.name} not recorded yet" if cardio_exercise.distance.blank?
      "#{cardio_exercise.distance} km in #{readable_duration(cardio_exercise)}"
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
