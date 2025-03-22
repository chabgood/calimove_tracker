# frozen_string_literal: true

class AddWeekendDaysToDayName < ActiveRecord::Migration[8.0]
  def up
    DayName.create(name: 'Saturday')
    DayName.create(name: 'Sunday')
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
