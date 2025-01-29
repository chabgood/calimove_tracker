class CreateDays < ActiveRecord::Migration[8.0]
  def change
    create_table :day_names do |t|
      t.string :name

      t.timestamps
    end

    create_table :levels do |t|
      t.string :number

      t.timestamps
    end

    create_table :phases do |t|
      t.string :number

      t.timestamps
    end

    create_table :workout_names do |t|
      t.string :name

      t.timestamps
    end

    create_table :days do |t|
      t.references :day_name, foreign_key: :true
      t.references :level, foreign_key: :true
      t.references :phase, foreign_key: :true
      t.references :week, null: false, foreign_key: true
      t.string :workout
      t.references :workout_name, foreign_key: :true
      t.string :intensity

      t.timestamps
    end
    add_index :day_names, :name, unique: true
    add_index :levels, :number, unique: true
    add_index :phases, :number, unique: true
    add_index :workout_names, :name, unique: true
  end
end
