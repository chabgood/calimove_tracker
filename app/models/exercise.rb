class Exercise < ApplicationRecord
  belongs_to :day
  belongs_to :workout_name

  belongs_to :exercise_status, foreign_key: "exercise_statuses_id"

  belongs_to :level, optional: true

  belongs_to :phase, optional: true

  default_scope { order(:number) }

  attr_accessor :copy_rest_time
  def exercise_workout_name
    @exercise_workout_name ||= self.workout_name.name
  end

  trigger.before(:insert).before(:update) do
    "NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
      join exercise_statuses es on es.id = e1.exercise_statuses_id
      WHERE e1.workout_name_id = NEW.workout_name_id
      and es.name <> 'test'
      ORDER BY e1.id ASC LIMIT 1);"
  end
end
