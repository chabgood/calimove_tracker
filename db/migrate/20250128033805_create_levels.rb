class CreateLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :levels do |t|
      t.string :number

      t.timestamps
    end

    add_index :levels, :number, unique: true
  end
end
