class CreateTableWorkoutsExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises_workouts, id: false do |t|
      t.uuid :workout_id, null: false
      t.uuid :exercise_id, null: false
    end

    add_index :exercises_workouts, [:exercise_id, :workout_id], unique: true
  end
end
