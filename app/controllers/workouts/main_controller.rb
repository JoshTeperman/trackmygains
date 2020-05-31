module Workouts
  class MainController < ApplicationController
    before_action :set_workout

    private

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end
  end
end
