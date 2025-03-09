class WeeksController < ApplicationController
  def show
    @week = Week.includes(:days).find_by(id: params[:id])
  end

  def index
    @weeks = Schedule.find(params[:schedule_id]).weeks
  end
end
