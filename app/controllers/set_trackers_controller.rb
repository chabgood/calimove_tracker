class SetTrackersController < ApplicationController
  def update
    tracker = SetTracker.find_by(id: params[:id])
    tracker.update(permitted_params)
    # respond_to do |format|
    # hotflash.flash_message = :some_other_way_to_show_the_message
    # format.html { render turbo_stream: turbo_stream.replace("your-element-id", partial: "your_partial", locals: { data: @data }) }
    # render layout: false
    # render nothing: true
    # end
  end

  private
  def permitted_params
    params.require(:set_tracker).permit(:completed)
  end
end
