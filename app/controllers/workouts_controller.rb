class WorkoutsController < ApplicationController
  def index
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :workout_name, :total, 
        lifts_attributes: [:_destroy, :id, :lift_name,
          groups_attributes: [:_destroy, :id, :reps, :weight]])
    end
end
