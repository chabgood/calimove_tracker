class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercise_statuses do |t|
      t.string :name
      t.timestamps
    end
    ExerciseStatus.create!([ { name: 'test' }, { name: 'work' }, { name: 'completed' } ])

    create_table :exercises do |t|
      t.references :day, foreign_key: :true
      t.references :level, foreign_key: :true
      t.references :phase, foreign_key: :true
      t.references :exercise_statuses, foreign_key: :true, index: true
      t.string :number
      t.string :workout
      t.references :workout_name, foreign_key: :true
      t.string :intensity
      t.timestamps
    end
  end
end
