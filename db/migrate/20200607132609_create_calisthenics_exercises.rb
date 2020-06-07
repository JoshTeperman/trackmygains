class CreateCalisthenicsExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :calisthenics_exercises, id: :uuid do |t|
      t.references :exercise_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
