class CreateRestTimes < ActiveRecord::Migration[8.0]
  def change
    create_table :rest_times do |t|
      t.string :name

      t.timestamps
    end
    rename_column :exercises, :rest_between_sets, :rest_between_sets_id
    rename_column :exercises, :rest_between_exercises, :rest_between_exercises_id
    change_column :exercises, :rest_between_sets_id, 'int USING CAST(rest_between_sets_id AS int)'
    change_column :exercises, :rest_between_exercises_id, 'int USING CAST(rest_between_exercises_id AS int)'
    add_foreign_key :exercises, :rest_times, column: :rest_between_sets_id, primary_key: "id"
    add_foreign_key :exercises, :rest_times, column: :rest_between_exercises_id, primary_key: "id"
  end
end
