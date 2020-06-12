class CreateCalisthenicsExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :calisthenics_exercises, id: :uuid do |t|

      t.timestamps
    end
  end
end
