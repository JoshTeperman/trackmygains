class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises, id: :uuid do |t|

      t.timestamps
    end
  end
end
