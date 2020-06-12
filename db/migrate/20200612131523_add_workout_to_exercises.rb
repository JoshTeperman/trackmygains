class AddWorkoutToExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :workout, null: false, foreign_key: true, type: :uuid
  end
end
