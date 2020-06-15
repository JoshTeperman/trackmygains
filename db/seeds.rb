exercise_types = [
  { name: 'Front Squat', category: :resistance, targets: ['legs'] },
  { name: 'Pushup', category: :calisthenics, targets: ['shoulders', 'chest', 'triceps', 'core'] },
  { name: 'Squat', category: :calisthenics, targets: ['legs'] },
  { name: 'Run', category: :cardio, targets: ['legs'] },
  { name: 'Box Jump', category: :cardio, targets: ['legs'] },
  { name: 'Sprint', category: :cardio, targets: ['legs'] },
  { name: 'Row', category: :cardio, targets: ['back, core'] }
].freeze

exercise_types.each { |exercise_type| ExerciseType.create!(exercise_type) }
