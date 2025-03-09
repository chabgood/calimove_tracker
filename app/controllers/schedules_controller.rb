class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.includes(:weeks)
  end
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.import(current_user, params[:schedule][:file])
    redirect_to root_path
  end
end
