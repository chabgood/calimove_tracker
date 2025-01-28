class CreateDays < ActiveRecord::Migration[8.0]
  def change
    create_table :days do |t|
      t.string :week_number
      t.references :week, null: false, foreign_key: true
      t.string :workout
      t.string :workout_name
      t.string :intensity

      t.timestamps
    end
  end
end
