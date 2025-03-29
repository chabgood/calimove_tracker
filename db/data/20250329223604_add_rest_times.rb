# frozen_string_literal: true

class AddRestTimes < ActiveRecord::Migration[8.0]
  def up
    [ "60 seconds", "90 seconds", "80 seconds", "2 minutes", "3 minutes" ].each do |time|
      RestTime.create!(name: time)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
