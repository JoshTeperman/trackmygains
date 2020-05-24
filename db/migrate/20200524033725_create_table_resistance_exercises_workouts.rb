class CreateTableResistanceExercisesWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :resistance_exercises_workouts, id: :uuid do |t|
      t.uuid :resistance_exercise_id, null: false
      t.uuid :workout_id, null: false
    end

    add_index :resistance_exercises_workouts, [:resistance_exercise_id, :workout_id], unique: true, name: :index_resistance_exercises_workouts
  end
end
