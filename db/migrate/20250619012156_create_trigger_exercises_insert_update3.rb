# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerExercisesInsertUpdate3 < ActiveRecord::Migration[8.0]
  def up
    drop_trigger("set_user_id", "exercises", :generated => true)

    create_trigger("set_user_id", :generated => true, :compatibility => 1).
        on("exercises").
        before(:insert, :update).
        name("set_user_id") do
      <<-SQL_ACTIONS
NEW.user_id = (SELECT s.user_id from exercises e
        JOIN days d on d.id = NEW.day_id
 			  JOIN weeks w on w.id = d.week_id
 			  JOIN schedules s on s.id = w.schedule_id
        where e.id = NEW.id);
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("set_user_id", "exercises", :generated => true)

    create_trigger("set_user_id", :generated => true, :compatibility => 1).
        on("exercises").
        after(:insert, :update).
        name("set_user_id") do
      <<-SQL_ACTIONS
NEW.user_id = (SELECT s.user_id from exercises e
        JOIN days d on d.id = NEW.day_id
 			  JOIN weeks w on w.id = d.week_id
 			  JOIN schedules s on s.id = w.schedule_id
        where e.id = NEW.id);
      SQL_ACTIONS
    end
  end
end
