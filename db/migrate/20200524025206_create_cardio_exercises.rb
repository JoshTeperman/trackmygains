class CreateCardioExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :cardio_exercises do |t|
      t.string :name
      t.integer :total_time
      t.datetime :start_time
      t.datetime :finish_time
      t.float :distance

      t.timestamps
    end
  end
end
