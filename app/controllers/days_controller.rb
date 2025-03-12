class DaysController < ApplicationController
  def show
    @day = Day.includes(:week, :day_name, exercises: [ :workout_name ]).find_by(id: params[:id])
  end
end
