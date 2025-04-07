# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerExercisesUpdate < ActiveRecord::Migration[8.0]
  def up
    create_trigger("exercises_before_update_row_tr", generated: true, compatibility: 1).
        on("exercises").
        before(:insert, :update) do
      <<-SQL_ACTIONS
NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
      WHERE e1.workout_name_id = NEW.workout_name_id
      ORDER BY e1.id ASC LIMIT 1);
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("exercises_before_update_row_tr", "exercises", generated: true)
  end
end
