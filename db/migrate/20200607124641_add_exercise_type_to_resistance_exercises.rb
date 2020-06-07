class AddExerciseTypeToResistanceExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :resistance_exercises, :exercise_type, null: false, foreign_key: true, type: :uuid
  end
end
