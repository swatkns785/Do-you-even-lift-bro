class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      flash[:notice] = "Your workout session has been successfully created."
      redirect_to workouts_path
    else
      flash[:alert] = "Please fill out the forms correctly."
      render :new
    end
  end

private

def workout_params
  params.require(:workout).permit(:title, :description, :date)
end

end
