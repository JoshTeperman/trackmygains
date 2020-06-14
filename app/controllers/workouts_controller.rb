class WorkoutsController < ApplicationController
  before_action :set_current_workout
  before_action :set_workout, only: [:edit, :show, :destroy]

  def new
  end

  def show
    @exercises = @workout.exercises
  end

  def edit
  end

  def create
    @workout = Workout.new(start_time: Time.now)

    if @workout.save
      flash[:success] = 'Starting new workout!'
      redirect_to @workout
    else
      flash[:failure] = 'Failed to create workout'
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current_workout
    @current_workout ||= Workout.started.last
  end

  private

    def set_workout
      @workout = Workout.find params[:id]
    end

    def workout_params
      params.require(:workout).permit(:start_time)
    end
end

