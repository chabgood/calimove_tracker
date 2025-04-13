class SetTrackersController < ApplicationController
  def update
    tracker = SetTracker.includes(:exercise).find_by(id: params[:id])
    tracker.update(permitted_params)
    render turbo_stream: turbo_stream.replace("set_trackers_exercise_#{tracker.id}", 
                                                partial: "days/set_tracker_form",
                                                locals: { exercise: tracker.exercise })
  end

  private
  def permitted_params
    params.require(:set_tracker).permit(:completed)
  end
end
