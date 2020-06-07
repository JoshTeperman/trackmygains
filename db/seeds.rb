p 'Seeding Workouts...'

# exercise types
bench_press = ExerciseType.create!(name: 'Bench Press', targets: ['chest', 'shoulders', 'triceps'], category: :resistance)
barbell_squat = ExerciseType.create!(name: 'Barbell Squat', targets: ['legs'], category: :resistance)
rowing_machine = ExerciseType.create!(name: 'Rowing Machine', targets: ['back'], category: :cardio)

# current_workout
current_workout = Workout.create!(start_time: Time.now)

# completed workout 1
completed_workout = Workout.create!(start_time: 24.hours.ago, finish_time: 23.hours.ago, state: 'completed')
completed_workout_cardio_exercise = CardioExercise.new(
  total_time: 15,
  start_time: 24.hours.ago,
  finish_time: 24.hours.ago + 15.minutes,
  distance: 2.0
)
completed_workout_cardio_exercise.exercise_type = rowing_machine
completed_workout_cardio_exercise.save!

completed_workout_resistance_exercise_1 = ResistanceExercise.new
completed_workout_resistance_exercise_1.exercise_type = barbell_squat
completed_workout_resistance_exercise_1.save!

completed_workout.exercises << Exercise.create!(exercisable: completed_workout_cardio_exercise)
completed_workout.exercises << Exercise.create!(exercisable: completed_workout_resistance_exercise_1)

# completed workout 2
completed_workout_2 = Workout.create!(start_time: 48.hours.ago, finish_time: 45.hours.ago, state: 'completed')
completed_workout_2_exercise = ResistanceExercise.new
completed_workout_2_exercise.exercise_type = bench_press
completed_workout_2_exercise.save!

completed_workout_2.exercises << Exercise.create!(exercisable: completed_workout_2_exercise)

