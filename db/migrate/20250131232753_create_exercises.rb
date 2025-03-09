class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercises do |t|
      t.references :day, foreign_key: :true
      t.references :level, foreign_key: :true
      t.references :phase, foreign_key: :true
      t.string :number
      t.string :workout
      t.references :workout_name, foreign_key: :true
      t.string :intensity
      t.timestamps
    end
  end
end
