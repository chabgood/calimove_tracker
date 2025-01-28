class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.new.import(params[:schedule][:file])
  end
end
