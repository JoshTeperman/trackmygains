class CreateExerciseTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_types, id: :uuid do |t|
      t.string :name
      t.string :targets, array: true
      t.string :category

      t.timestamps
    end
  end
end
