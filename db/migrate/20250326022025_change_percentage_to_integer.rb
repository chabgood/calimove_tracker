class ChangePercentageToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column(:exercises, :percentage, :integer)
  end
end
