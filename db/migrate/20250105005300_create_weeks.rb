class CreateWeeks < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks do |t|
      t.references :schedule, foreign_key: :true, index: true
      t.integer :number, default: 0

      t.timestamps
    end
  end
end
