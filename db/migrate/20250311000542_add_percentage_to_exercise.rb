class AddPercentageToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :percentage, :decimal, precision: 3, scale: 2
  end
end
