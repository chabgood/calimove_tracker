class CreateWeekNumbers < ActiveRecord::Migration[8.0]
  def change
    create_table :week_numbers do |t|
      t.string :number

      t.timestamps
    end

    add_index :week_numbers, :number, unique: true
  end
end
