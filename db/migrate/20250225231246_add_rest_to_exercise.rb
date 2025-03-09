class AddRestToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :rest, :string, limit: 50
    add_column :exercises, :rest_between_exercises, :string, limit: 50
  end
end
