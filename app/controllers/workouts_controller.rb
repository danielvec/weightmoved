class WorkoutsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @workouts = current_user.workouts.order(date: :desc)
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      flash.now[:error] = @workout.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    redirect_to workouts_path, status: :see_other
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :workout_name, :total, 
        lifts_attributes: [:_destroy, :id, :lift_name,
          groups_attributes: [:_destroy, :id, :reps, :weight]])
    end
end
