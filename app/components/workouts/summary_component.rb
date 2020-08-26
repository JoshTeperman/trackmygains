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
    "#{pluralize(minutes, 'minute')}"
  end

  def exercise_detail(exercise)
    case exercise.exercisable_type
    when 'CalisthenicsExercise'
      set_count = exercise.exercise_sets.count
      rep_count = exercise.exercise_sets.pluck(:reps).inject(:+)
      "#{pluralize(set_count, 'set')}, #{rep_count} reps"
    when 'ResistanceExercise'
      set_count = exercise.exercise_sets.count
      max_weight = exercise.exercise_sets.pluck(:weight).max
      "#{pluralize(set_count, 'set')}, max #{max_weight} kg"
    when 'CardioExercise'
      cardio_exercise = CardioExercise.find_by(id: exercise.exercisable_id)
      total_time = ((cardio_exercise.finish_time - cardio_exercise.start_time).seconds / 60).to_i
      "#{cardio_exercise.distance} km in #{total_time} minutes"
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
