class CreateJoinTableCardioExercisesWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cardio_exercises, :workouts do |t|
      # t.index [:cardio_exercise_id, :workout_id]
      # t.index [:workout_id, :cardio_exercise_id]
    end
  end
end
