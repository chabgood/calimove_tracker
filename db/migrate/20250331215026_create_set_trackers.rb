class CreateSetTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :set_trackers do |t|
      t.belongs_to :exercise, null: false, foreign_key: true, index: true
      t.boolean :completed

      t.timestamps
    end
  end
end
