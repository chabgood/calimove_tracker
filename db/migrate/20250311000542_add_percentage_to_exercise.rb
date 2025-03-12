class AddPercentageToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :percentage, :decimal, precision: 1, scale: 1
  end
end
