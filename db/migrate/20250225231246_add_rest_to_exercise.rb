class AddRestToExercise < ActiveRecord::Migration[8.0]
  def change
    add_column :exercises, :rest, :string, limit: 50
  end
end
