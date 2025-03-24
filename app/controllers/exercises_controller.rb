class ExercisesController < ApplicationController
  before_action :set_exercise, only: [ :update ]

  def update
    respond_to do |format|
      format.turbo_stream do
        if @exercise.update!(permitted_params)
          @exercise.update!(workout_value: calculate_percentage) if params[:exercise][:percentage].present?
          update_rest_time if params[:exercise][:copy_rest_time].present?
          format.turbo_stream
        else
          render :new, status: 422
        end
      end
    end
  end

  private
  def permitted_params
    params.expect(exercise: [ :rest, :test_result, :copy_rest_time, :notes, :percentage ])
  end

  def set_exercise
    @exercise = Exercise.eager_load(day: [ :day_name, :week, exercises: [ :level, :phase, :workout_name ] ]).find_by(id: params[:id])
  end

  def update_rest_time
    if params[:exercise][:copy_rest_time] == "1"
      @exercise.update(rest_between_exercises: params[:exercise][:rest])
    else
      @exercise.update(rest_between_exercises: nil)
    end
  end
  def calculate_percentage
    test_value = Exercise.unscoped.where(workout_name_id: @exercise.workout_name_id).first.test_result.to_i
    (test_value * params[:exercise][:percentage].to_f).round
  end
end
