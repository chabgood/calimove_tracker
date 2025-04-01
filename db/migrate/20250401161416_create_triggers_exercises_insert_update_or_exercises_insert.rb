# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersExercisesInsertUpdateOrExercisesInsert < ActiveRecord::Migration[8.0]
  def up
    create_trigger("exercises_after_insert_row_tr", generated: true, compatibility: 1).
        on("exercises").
        after(:insert) do
      <<-SQL_ACTIONS
      Insert Into set_trackers (exercise_id, created_at, updated_at)
			Select id, NOW(), NOW()
			From exercises e Inner Join Lateral generate_series(1, e.sets) As t On true
			where e.id = NEW.id;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("exercises_after_insert_row_tr", "exercises", generated: true)
  end
end
