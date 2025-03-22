class AddTestTypeToWeek < ActiveRecord::Migration[8.0]
  def change
    rename_column :exercises, :rest, :rest_between_sets
    WeekStatus.create(name: 'test')
  end
end
