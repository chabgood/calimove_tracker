class WeeksController < ApplicationController
  def show
    @week = Week.includes(:week_status, days: [ :day_name ]).find_by(id: params[:id])
  end

  def index
    @weeks = Schedule.includes(:weeks).find(params[:schedule_id]).weeks
  end

  def destroy
    @week = Week.find_by(id: params[:id])
    if @week.destroy
      redirect_to schedule_path(@week.schedule)
    end
  end

  def duplicate
    week = Week.find_by(id: params[:id])
    RailsDeepCopy::Duplicate.create(week)
    redirect_to schedule_path(week.schedule)
  end
end
