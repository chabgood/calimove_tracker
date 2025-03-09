class DaysController < ApplicationController
  def show
    @day = Day.includes(exercises: [:workout_name]).find_by(id: params[:id])
  end
end
