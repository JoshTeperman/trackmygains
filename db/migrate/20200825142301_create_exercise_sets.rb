class CreateExerciseSets < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_sets do |t|
      t.integer :weight
      t.integer :goal_reps
      t.integer :reps
      t.references :exercise, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
