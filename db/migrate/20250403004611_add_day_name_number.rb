class AddDayNameNumber < ActiveRecord::Migration[8.0]
  def change
    add_column :day_names, :number, :integer
  end
end
