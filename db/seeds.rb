p 'Seeding Workouts...'

# current_workout

current_workout = Workout.create!(start_time: Time.now)

# completed workouts
completed_workout = Workout.new(start_time: 24.hours.ago, finish_time: 23.hours.ago, state: 'completed')
completed_workout_cardio_exercise = CardioExercise.create!(
  name: 'elliptical',
  total_time: 15,
  start_time: 24.hours.ago,
  finish_time: 24.hours.ago + 15.minutes,
  distance: 2.0
)
completed_workout_resistance_exercise_1 = ResistanceExercise.create!(
  name: 'sit-up',
  target: 'core'
)

completed_workout.exercises << Exercise.create!(exercisable: completed_workout_cardio_exercise)
completed_workout.exercises << Exercise.create!(exercisable: completed_workout_resistance_exercise_1)

completed_workout.save!


completed_workout_2 = Workout.create!(start_time: 48.hours.ago, finish_time: 45.hours.ago, state: 'completed')
completed_workout_2_exercise = ResistanceExercise.create!(
  name: 'deadlift',
  target: 'back'
)
completed_workout_2.exercises << Exercise.create!(exercisable: completed_workout_2_exercise)

