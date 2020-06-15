module Interactors
  module Exercises
    class Create
      include Interactor

      def initialize(args = {})
        super
        @exercise_form = context.exercise_form
        @workout = exercise_form.workout
        @category = exercise_form.category
        @exercise_type = exercise_form.exercise_type
      end

      def call
        return context.fail!(errors: exercise_form.errors) unless exercise_form.valid?

        new_exercise = Exercise.create!(
          exercisable: class_eval(Exercise::CLASS_NAMES[category]).new,
          workout: workout,
          exercise_type: exercise_type
        )

        if new_exercise.save
          context.exercise = new_exercise
        else
          context.fail!(errors: new_exercise.errors)
        end
      end

      private

      attr_reader :exercise_form, :exercise_type, :category, :workout
    end
  end
end
