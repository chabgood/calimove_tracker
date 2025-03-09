class AddSetsToExercises < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :sets, :integer, default: 0
  end
end
