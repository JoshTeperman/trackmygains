class CreateResistanceExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :resistance_exercises do |t|
      t.string :name
      t.string :target

      t.timestamps
    end
  end
end
