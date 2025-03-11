class ExercisesController < ApplicationController
  def update_rest_time
    @exercise = Exercise.find params[:id]

    respond_to do |format|
      format.turbo_stream do
        if @exercise.update(permitted_params)
          if params[:exercise][:copy_rest_time] == "1"
            @exercise.update(rest_between_exercises: params[:exercise][:rest])
          else
            @exercise.update(rest_between_exercises: nil)
          end
          format.turbo_stream
        else
          render :new, status: 422
        end
      end
    end
  end

  def update_test_result
    @exercise = Exercise.find params[:id]

    respond_to do |format|
      format.turbo_stream do
        if @exercise.update(permitted_params)
          format.turbo_stream
        else
          render :new, status: 422
        end
      end
    end
  end

  def update_notes
    @exercise = Exercise.find params[:id]

    respond_to do |format|
      format.turbo_stream do
        if @exercise.update(permitted_params)
          format.turbo_stream
        else
          render :new, status: 422
        end
      end
    end
  end

  def update_percentage
    @exercise = Exercise.find params[:id]

    respond_to do |format|
      format.turbo_stream do
        if @exercise.update(permitted_params)
          @exercise.update(workout_value: calculate_percentage)
          format.turbo_stream
        else
          render :new, status: 422
        end
      end
    end
  end

  def permitted_params
    params.expect(exercise: [ :rest, :test_result, :copy_rest_time, :notes, :percentage ])
  end

  def calculate_percentage
    test_value = Exercise.unscoped.where(workout_name_id: @exercise.workout_name_id).first.test_result.to_i
    (test_value * params[:exercise][:percentage].to_f).round
  end
end
