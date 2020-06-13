module Workouts
  class ResistanceExercisesController < Workouts::MainController
    before_action :set_exercise, only: [:show]

    def index
    end

    def show
    end

    private

    def set_exercise
      @exercise = ResistanceExercise.find(params[:id])
    end
  end
end
