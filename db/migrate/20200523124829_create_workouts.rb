class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.datetime :start_time
      t.datetime :finish_time
      t.string :state

      t.timestamps
    end
  end
end
