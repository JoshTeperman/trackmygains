class CreateResistanceExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :resistance_exercises, id: :uuid do |t|

      t.timestamps
    end
  end
end
