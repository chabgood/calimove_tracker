class CreatePhases < ActiveRecord::Migration[8.0]
  def change
    create_table :phases do |t|
      t.string :number

      t.timestamps
    end

    add_index :phases, :number, unique: true
  end
end
