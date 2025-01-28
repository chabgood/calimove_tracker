class CreateWeekNames < ActiveRecord::Migration[8.0]
  def change
    create_table :week_names do |t|
      t.string :name

      t.timestamps
    end

    add_index :week_names, :name, unique: true
  end
end
