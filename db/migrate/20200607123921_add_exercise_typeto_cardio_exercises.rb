class AddExerciseTypetoCardioExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :cardio_exercises, :exercise_type, null: false, foreign_key: true, type: :uuid
  end
end
