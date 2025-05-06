# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerExercisesInsertUpdate2 < ActiveRecord::Migration[8.0]
  def up
    drop_trigger("set_workout_value", "exercises", :generated => true)

    create_trigger("set_workout_value", :generated => true, :compatibility => 1).
        on("exercises").
        before(:insert, :update).
        name("set_workout_value") do
      <<-SQL_ACTIONS
NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
 			JOIN days d on d.id = NEW.day_id
 			JOIN weeks w on w.id = d.week_id
 			JOIN schedules s on s.id = w.schedule_id
      WHERE e1.workout_name_id = NEW.workout_name_id
      AND s.user_id = NEW.user_id
      AND e1.test_result is NOT NULL
      ORDER BY e1.id DESC LIMIT 1);
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("set_workout_value", "exercises", :generated => true)

    create_trigger("set_workout_value", :generated => true, :compatibility => 1).
        on("exercises").
        before(:insert, :update).
        name("set_workout_value") do
      <<-SQL_ACTIONS
NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
 			JOIN days d on d.id = NEW.day_id
 			JOIN weeks w on w.id = d.week_id
 			JOIN schedules s on s.id = w.schedule_id
      WHERE e1.workout_name_id = NEW.workout_name_id
      AND s.user_id = NEW.user_id
      AND e1.test_result is NOT NULL
      ORDER BY e1.id ASC LIMIT 1);
      SQL_ACTIONS
    end
  end
end
