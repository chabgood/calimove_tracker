class SetTrackersController < ApplicationController
  def update
    @tracker = SetTracker.includes(:exercise).find_by(id: params[:id])
    @tracker.update(permitted_params)
    flash.now[:success] = "Set #{params[:set]} saved"
  end

  private
  def permitted_params
    params.require(:set_tracker).permit(:completed)
  end
end
