p 'Seeding...'

CARDIO_EXERCISE_TYPES = [
  { name: 'Run', category: :cardio, targets: ['legs'] },
  { name: 'Sprint', category: :cardio, targets: ['legs'] },
  { name: 'Row', category: :cardio, targets: ['back, core'] }
].freeze

RESISTANCE_EXERCISE_TYPES = [
  { name: 'Front Squat', category: :resistance, targets: ['legs'] },
  { name: 'Shoulder Press', category: :resistance, targets: ['shoulders, arms'] },
  { name: 'Deadlift', category: :resistance, targets: ['back, legs'] },
].freeze

CALISTHENICS_EXERCISE_TYPES = [
  { name: 'Pushup', category: :calisthenics, targets: ['shoulders', 'chest', 'triceps', 'core'] },
  { name: 'Squat', category: :calisthenics, targets: ['legs'] },
  { name: 'Box Jump', category: :calisthenics, targets: ['legs'] },
].freeze

p 'Seeding Cardio Exercise Types'
cardio_exercise_types = CARDIO_EXERCISE_TYPES.map do |exercise_type|
  ExerciseType.create!(exercise_type)
end

p 'Seeding Resistance Exercise Types'
resistance_exercise_types = RESISTANCE_EXERCISE_TYPES.map do |exercise_type|
  ExerciseType.create!(exercise_type)
end

p 'Seeding Calisthenics Exercise Types'
calisthenics_exercise_types = CALISTHENICS_EXERCISE_TYPES.map do |exercise_type|
  ExerciseType.create!(exercise_type)
end

p 'Seeding completed Workout'

completed_workout = Workout.create!(
  start_time: 1.year.ago,
  finish_time: 1.year.ago + 2.hours,
  state: :completed
)

p 'Seeding completed Workout Exercises'

p 'Cardio exercise...'
completed_workout_cardio_exercise = CardioExercise.create!(
  start_time: completed_workout.start_time,
  finish_time: (completed_workout.start_time + 1.hour),
  distance: 1.2,
)
completed_workout.exercises.create(
  exercisable: completed_workout_cardio_exercise,
  exercise_type: cardio_exercise_types.sample
)

p 'Resistance exercises...'
completed_workout_resistance_exercises = Array.new(3) { ResistanceExercise.create! }

completed_workout_resistance_exercises.each_with_index do |exercise, index|
  completed_workout.exercises.create(
    exercisable: exercise,
    exercise_type: resistance_exercise_types[index]
  )
end

p 'Calisthenics exercises...'
completed_workout_calisthenics_exercises = Array.new(2) { CalisthenicsExercise.create! }

completed_workout_calisthenics_exercises.shuffle.each_with_index do |exercise, index|
  completed_workout.exercises.create(
    exercisable: exercise,
    exercise_type: calisthenics_exercise_types[index]
  )
end



