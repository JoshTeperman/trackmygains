class AddExercisableToExercise < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :exercisable, polymorphic: true, null: false, index: true
  end
end
