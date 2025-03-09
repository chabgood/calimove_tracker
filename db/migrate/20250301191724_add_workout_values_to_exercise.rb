class AddWorkoutValuesToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :test_result, :string, limit: 10
    add_column :exercises, :workout_value, :string, limit: 10
    add_column :exercises, :notes, :text
  end
end
