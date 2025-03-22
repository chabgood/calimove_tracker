class WeeksController < ApplicationController
  def show
    @week = Week.includes(:week_status, days: [ :day_name ]).find_by(id: params[:id])
  end

  def index
    @weeks = Schedule.includes(:weeks).find(params[:schedule_id]).weeks
  end
end
