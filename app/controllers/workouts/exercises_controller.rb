module Workouts
  class ExercisesController < Workouts::MainController
    before_action :set_exercise, only: [:edit]

    def new
      @exercise_form = BusinessModels::Workouts::Exercise.new(workout: @workout)
    end

    def create
      exercise_type = ExerciseType.find_by(id: exercise_params[:exercise_type_id])
      @exercise_form = BusinessModels::Workouts::Exercise.new(workout: @workout, exercise_type: exercise_type)

      result = Interactors::Exercises::Create.call(exercise_form: @exercise_form)

      if result.success?
        redirect_to workout_exercise_path(@workout, result.exercise)
      else
        render new_workout_exercise_path(@workout)
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def exercise_params
      params.require(:business_models_workouts_exercise).permit(:exercise_type_id)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
  end
end
