module ApplicationHelper
  def find_next_day(day)
    day.week.days.find_by(id: day.id + 1)
  end

  def find_previous_day(day)
    day.week.days.find_by(id: day.id - 1)
  end

  def percentage_select
    (10..100).step(10).map { |n| [ "#{n}%", n ] }
  end

  def render_flash
    return if @_flash_rendered
    render partial: "shared/flash"
  end

  def exercise_status
    Rails.cache.fetch("exercise_status", expires_in: 1.week) do
      ExerciseStatus.order(:name).pluck(:name, :id)
    end
  end

  def rest_time
    Rails.cache.fetch("rest_times", expires_in: 1.week) do
      RestTime.order(:name).pluck(:name, :id)
    end
  end

  def workout_name
    Rails.cache.fetch("workout_name", expires_in: 1.week) do
      WorkoutName.order(:name).pluck(:name, :id)
    end
  end

  def day_name
    Rails.cache.fetch("day_name", expires_in: 1.week) do
      DayName.order(:number).pluck(:name, :id)
    end
  end
end
