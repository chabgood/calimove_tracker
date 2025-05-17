class Exercise < ApplicationRecord
  belongs_to :day
  belongs_to :workout_name
  
  belongs_to :exercise_status, foreign_key: "exercise_statuses_id", optional: true

  belongs_to :level, optional: true

  belongs_to :phase, optional: true

  belongs_to :sets_rest_time, class_name: "RestTime", foreign_key: "rest_between_sets_id", optional: true
  belongs_to :exercise_rest_time, class_name: "RestTime", foreign_key: "rest_between_exercises_id", optional: true

  has_many :set_trackers, dependent: :destroy
  DUPLICABLE_DEFAULTS = {notes: ''}
  # after_save :create_set_trackers

  default_scope { order(:number) }

  attr_accessor :copy_rest_time
  def exercise_workout_name
    @exercise_workout_name ||= self.workout_name.name
  end

  trigger.before(:insert, :update).name("set_workout_value") do
    "NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
 			JOIN days d on d.id = NEW.day_id
 			JOIN weeks w on w.id = d.week_id
 			JOIN schedules s on s.id = w.schedule_id
      WHERE e1.workout_name_id = NEW.workout_name_id
      AND s.user_id = NEW.user_id
      AND e1.test_result is NOT NULL
      ORDER BY e1.id DESC LIMIT 1);"
  end

  trigger.after(:insert) do
    "Insert Into set_trackers (exercise_id, created_at, updated_at)
			Select id, NOW(), NOW()
			From exercises e Inner Join Lateral generate_series(1, e.sets) As t On true
			where e.id = NEW.id;"
  end

  trigger.before(:insert, :update).name("set_user_id") do
    "NEW.user_id = (SELECT s.user_id from exercises e
        JOIN days d on d.id = NEW.day_id
 			  JOIN weeks w on w.id = d.week_id
 			  JOIN schedules s on s.id = w.schedule_id
        where e.id = NEW.id);"
  end

  def create_set_trackers
    if self.set_trackers.size < self.sets
      (self.set_trackers.size - self.sets).times do
        SetTracker.find_or_create_by(exercise_id: id)
      end
    end
  end
end
