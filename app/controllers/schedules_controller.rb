class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy]
  def index
    @schedules = current_user.schedules.includes(:weeks)
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update!(schedule_params)
      redirect_to @schedule
    else
      render :new
    end
  end
  def new
    @schedule = Schedule.new
    @schedule.weeks.build
    @schedule.weeks.map(&:days).map(&:build).map(&:exercises).map(&:build)
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "schedule",
          partial: "form",
          locals: { article: @schedule }
        )
      end
    end
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    if @schedule.save!
      redirect_to @schedule
    else
      render :new
    end
  end
  def new_upload
    @schedule = Schedule.new
  end

  def create_upload
    @schedule = Schedule.import(current_user, params[:schedule][:file])
    redirect_to root_path
  end

  def destroy
    if @schedule.destroy
      redirect_to schedules_path
    end
  end

  private

  def set_schedule
    @schedule = Schedule.includes(weeks: [ days: [ :day_name,  :exercises ] ]).find_by(id: params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title,
      weeks_attributes: [ :id, :number, :_destroy, :week_status,
      days_attributes: [ :_destroy, :id, :day_name_id,
      exercises_attributes: [ :_destroy, :id, :grouped, :workout_name_id, :percentage, :number, :exercise_statuses_id, :intensity, :sets, :rest_between_sets_id, :rest_between_exercises_id ] ] ]
    )
  end
end
