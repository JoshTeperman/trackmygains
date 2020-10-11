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
EXERCISE_GOAL_REPS = [5, 10, 15, 20].freeze
EXERCISE_WEIGHTS = (2..100).step(2).to_a

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
completed_workout_cardio_exercise = CardioExercise.create!

new_cardio_exercise = completed_workout.exercises.create(
  exercisable: completed_workout_cardio_exercise,
  exercise_type: cardio_exercise_types.sample
)

new_cardio_exercise.exercise_sets.create!(
  start_time: completed_workout.start_time,
  finish_time: (completed_workout.start_time + 1.hour),
  distance: 1.2,
  goal_reps: 1,
  reps: 1
)

p 'Resistance exercises...'
completed_workout_resistance_exercises = Array.new(3) { ResistanceExercise.create! }

completed_workout_resistance_exercises.each_with_index do |resistance_exercise, index|
  new_exercise = completed_workout.exercises.create(
    exercisable: resistance_exercise,
    exercise_type: resistance_exercise_types[index],
  )

  rand(1..5).times do
    reps = EXERCISE_GOAL_REPS.sample
    new_exercise.exercise_sets.create!(
      weight: EXERCISE_WEIGHTS.sample,
      goal_reps: reps,
      reps: reps
    )
  end
end

p 'Calisthenics exercises...'
completed_workout_calisthenics_exercises = Array.new(2) { CalisthenicsExercise.create! }

completed_workout_calisthenics_exercises.shuffle.each_with_index do |calisthenics_exercise, index|
  new_exercise = completed_workout.exercises.create(
    exercisable: calisthenics_exercise,
    exercise_type: calisthenics_exercise_types[index]
  )

  rand(1..5).times do
    reps = EXERCISE_GOAL_REPS.sample
    new_exercise.exercise_sets.create!(
      goal_reps: reps,
      reps: reps
    )
  end
end

p 'Seeding current workout...'

current_workout = Workout.create!(
  start_time: 2.minutes.ago,
  state: :started
)

p 'Seeding current Workout Exercises'

p 'Resistance exercise...'
current_workout_resistance_exercise = ResistanceExercise.create!

new_exercise = current_workout.exercises.create(
  exercisable: current_workout_resistance_exercise,
  exercise_type: resistance_exercise_types.sample
)

rand(1..5).times do
  reps = EXERCISE_GOAL_REPS.sample
  new_exercise.exercise_sets.create!(
    weight: EXERCISE_WEIGHTS.sample,
    goal_reps: reps,
    reps: reps
  )
end

p 'Calisthenics exercises...'

current_workout_calisthenics_exercise = CalisthenicsExercise.create!

new_exercise = current_workout.exercises.create(
  exercisable: current_workout_calisthenics_exercise,
  exercise_type: calisthenics_exercise_types.sample
)

