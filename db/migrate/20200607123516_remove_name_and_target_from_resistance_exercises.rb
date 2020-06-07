class RemoveNameAndTargetFromResistanceExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :resistance_exercises, :name
    remove_column :resistance_exercises, :target
  end
end
