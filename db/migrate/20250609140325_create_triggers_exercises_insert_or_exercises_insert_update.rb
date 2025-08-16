# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersExercisesInsertOrExercisesInsertUpdate < ActiveRecord::Migration[8.0]
  def up
    drop_trigger("exercises_after_insert_row_tr", "exercises", :generated => true)

    drop_trigger("set_user_id", "exercises", :generated => true)

    create_trigger("exercises_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("exercises").
        after(:insert) do
      <<-SQL_ACTIONS
Insert Into set_trackers (exercise_id, created_at, updated_at)
			Select id, NOW(), NOW()
			From exercises e Inner Join Lateral generate_series(1, NEW.sets) As t On true
			where e.id = NEW.id;
      SQL_ACTIONS
    end

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

  def down
    drop_trigger("exercises_after_insert_row_tr", "exercises", :generated => true)

    drop_trigger("set_user_id", "exercises", :generated => true)

    create_trigger("exercises_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("exercises").
        after(:insert) do
      <<-SQL_ACTIONS
Insert Into set_trackers (exercise_id, created_at, updated_at)
			Select id, NOW(), NOW()
			From exercises e Inner Join Lateral generate_series(1, e.sets) As t On true
			where e.id = NEW.id;
      SQL_ACTIONS
    end

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
end
