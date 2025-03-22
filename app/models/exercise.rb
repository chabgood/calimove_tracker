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
end
