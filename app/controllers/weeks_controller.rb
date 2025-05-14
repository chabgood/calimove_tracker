class WeeksController < ApplicationController
  def show
    @week = Week.includes(:week_status, days: [ :day_name ]).find_by(id: params[:id])
  end

  def index
    @weeks = Schedule.includes(:weeks).find(params[:schedule_id]).weeks
  end

  def duplicate
    week = Week.find_by(id: params[:id])
    new_week = week.deep_clone(include: {days: :exercises}, except: [:set_trackers])
    new_week.save!
    redirect_to schedule_path(new_week.schedule)
  end
end
