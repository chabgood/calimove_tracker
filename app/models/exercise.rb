class Exercise < ApplicationRecord
  belongs_to :day
  belongs_to :workout_name

  def exercise_workout_name
    @exercise_workout_name ||= self.workout_name.name
  end
end
