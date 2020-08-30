class RemoveDistanceStartTimeFinishTimeFromCardioExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :cardio_exercises, :distance
    remove_column :cardio_exercises, :start_time
    remove_column :cardio_exercises, :finish_time
    remove_column :cardio_exercises, :total_time
  end
end
