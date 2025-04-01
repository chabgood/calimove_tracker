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
end
