# frozen_string_literal: true

class InsertBulkExercises < ActiveRecord::Migration[8.0]
  def up
    CSV.foreach("#{Rails.root}/lib/megaGymDataset.csv", headers: :first_row, return_headers: false) do |line|
      WorkoutName.find_or_create_by(name: line[1])
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
