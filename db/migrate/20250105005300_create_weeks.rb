class CreateWeeks < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks do |t|
      t.string :name
      t.string :level
      t.references :schedule, foreign_key: :true, index: true
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
