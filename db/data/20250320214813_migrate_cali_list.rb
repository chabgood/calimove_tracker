# frozen_string_literal: true

class MigrateCaliList < ActiveRecord::Migration[8.0]
  def up
    File.readlines('lib/calisthenics_list.txt', chomp: true).each do |line|
      WorkoutName.find_or_create_by(name: line)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
