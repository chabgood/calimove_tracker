class DaysController < ApplicationController
  def show
    @day = Day.includes(:day_name, week: :schedule, exercises: [ :level, :phase, :workout_name ])
      .references(:exercises).order("exercises.number").find_by(id: params[:id])
  end
end
