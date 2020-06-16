module Interactors
  module ExerciseTypes
    class Create
      include Interactor

      delegate :exercise_type_form, to: :context
      delegate :name, :category, :targets, to: :exercise_type_form

      def call
        return context.fail!(errors: exercise_type_form.errors) unless exercise_type_form.valid?

        new_exercise_type = ExerciseType.new(name: name, category: category, targets: targets)

        if new_exercise_type.save
          context.exercise_type = new_exercise_type
        else
          context.fail!(errors: new_exercise.errors)
        end
      end
    end
  end
end
