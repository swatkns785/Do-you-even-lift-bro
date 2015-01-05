class ExercisesController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    @exercise.workout_id = @workout.id
    if @exercise.save
      flash[:notice] = "Exercise added."
      redirect_to workout_path(@exercise.workout_id)
    else
      redirect_to workout_path(@exercise.workout_id)
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :reps, :user_id, :workout_id)
  end

end
