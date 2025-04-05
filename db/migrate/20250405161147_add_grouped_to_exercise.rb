class AddGroupedToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :grouped, :boolean, default: false
  end
end
