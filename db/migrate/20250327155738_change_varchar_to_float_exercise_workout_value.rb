class ChangeVarcharToFloatExerciseWorkoutValue < ActiveRecord::Migration[8.0]
  def up
    change_column :exercises, :workout_value, 'float USING CAST(workout_value AS float)'
    change_column :exercises, :test_result, 'int USING CAST(workout_value AS int)'
  end

  def down
    change_column :exercises, :workout_value, :integer
  end
end
