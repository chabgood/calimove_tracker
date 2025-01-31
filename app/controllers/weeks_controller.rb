class WeeksController < ApplicationController
  def show
    @week = Week.includes(:days).find_by(id: params[:id])
  end
end
