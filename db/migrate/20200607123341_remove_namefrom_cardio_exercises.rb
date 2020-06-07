class RemoveNamefromCardioExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :cardio_exercises, :name
  end
end
