class CreateJoinTableResistanceExercisesWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :resistance_exercises, :workouts do |t|
      # t.index [:workout_id, :resistance_exercise_id]
      # t.index [:resistance_exercise_id, :workout_id]
    end
  end
end
