class ExerciseTypesController < ApplicationController
  def new
    @exercise_type_form ||= BusinessModels::ExerciseType.new
  end

  def create
    @exercise_type_form = BusinessModels::ExerciseType.new(exercise_type_params)
    result = Interactors::ExerciseTypes::Create.call(exercise_type_form: @exercise_type_form)

    if result.success?
      current_workout = Workout.find_by(state: 'started')
      redirect_to new_workout_exercise_path(current_workout)
    else
      flash.now[:error] = result.error
      render 'exercise_types/new'
    end
  end

  private

  def exercise_type_params
    params.require(:business_models_exercise_type).permit(:name, :targets, :category)
  end
end
