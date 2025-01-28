class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.references :user, foreign_key: :true
      t.timestamps
    end
    add_index :schedules, [ :title, :user_id ], unique: true
  end
end
