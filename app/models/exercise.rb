class Exercise < ApplicationRecord
  belongs_to :day
  belongs_to :workout_name

  belongs_to :level

  belongs_to :phase
  default_scope { order(:number) }

  attr_accessor :copy_rest_time
  def exercise_workout_name
    @exercise_workout_name ||= self.workout_name.name
  end
end
