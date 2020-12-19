module Workouts
  class ExercisesController < Workouts::MainController
    before_action :set_exercise, only: [:show]

    def new
      @exercise_form = BusinessModels::Workouts::Exercise.new(workout: @workout)
    end

    def create
      exercise_type = ExerciseType.find_by(id: exercise_params[:exercise_type_id])
      @exercise_form = BusinessModels::Workouts::Exercise.new(workout: @workout, exercise_type: exercise_type)

      result = Interactors::Exercises::Create.call(exercise_form: @exercise_form)

      if result.success?
        exercise = result.exercise

        case exercise.exercisable_type
        when 'ResistanceExercise'
          redirect_to workout_resistance_exercise_path(@workout, exercise.exercisable_id)
        when 'CardioExercise'
          redirect_to workout_cardio_exercise_path(@workout, exercise.exercisable_id)
        when 'CalisthenicsExercise'
          redirect_to workout_calisthenics_exercise_path(@workout, exercise.exercisable_id)
        end
      else
        render :new
      end
    end

    def show
    end

    private

    def exercise_params
      params.require(:business_models_workouts_exercise).permit(:exercise_type_id)
    end

    def set_exercise
      @exercise = Exercise.find_by(exercisable_id: params[:id])
    end
  end
end
