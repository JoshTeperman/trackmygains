class CreateTableCardioExercisesWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :cardio_exercises_workouts, id: :uuid do |t|
      t.uuid :cardio_exercise_id, null: false
      t.uuid :workout_id, null: false
    end

    add_index :cardio_exercises_workouts, [:workout_id, :cardio_exercise_id], unique: true, name: :index_cardio_exercises_workouts
  end
end
