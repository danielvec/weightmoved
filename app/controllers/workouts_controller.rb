class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :workout_name, :total)
    end
end
