class SetTrackersController < ApplicationController
  hotflash.enable!
  def update
    tracker = SetTracker.includes(:exercise).find_by(id: params[:id])
    tracker.update(permitted_params)
    # hotflash.flash_message = 'some_other_way_to_show_the_message'
    turbo_stream.prepend "flash", partial: "shared/flash"
    render turbo_stream: turbo_stream.replace("set_trackers_exercise_#{tracker.id}", 
                                                partial: "days/set_tracker_form",
                                                locals: { exercise: tracker.exercise })
  end

  private
  def permitted_params
    params.require(:set_tracker).permit(:completed)
  end
end
