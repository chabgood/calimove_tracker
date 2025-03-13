class DaysController < ApplicationController
  def show
    @day = Day.eager_load(:day_name, exercises: [ :level, :phase, :workout_name ]).find_by(id: params[:id])
  end
end
