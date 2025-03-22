class CreateWeeks < ActiveRecord::Migration[8.0]
  def change
    create_table :week_statuses do |t|
      t.string :name
      t.timestamps
    end
    WeekStatus.create!([ { name: 'ready' }, { name: 'in_progress' }, { name: 'completed' } ])

    create_table :weeks do |t|
      t.references :schedule, foreign_key: :true, index: true
      t.references :week_statuses, foreign_key: :true, index: true
      t.integer :number, default: 0
      t.timestamps
    end
  end
end
