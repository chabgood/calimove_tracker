module ApplicationHelper
  def find_next_day(day)
    day.week.days.find_by(id: day.id + 1)
  end
end
