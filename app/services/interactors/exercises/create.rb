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
        if exercise_form.valid?
          case category
          when 'resistance'
            new_exercise = Exercise.create!(
              exercisable: ResistanceExercise.new,
              workout: workout,
              exercise_type: exercise_type
            )
          when 'calisthenics'
            new_exercise = Exercise.create!(
              exercisable: CalisthenicsExercise.new,
              workout: workout,
              exercise_type: exercise_type
            )
          when 'cardio'
            new_exercise = Exercise.create!(
              exercisable: ResistanceExercise.new(start_time: Time.current),
              workout: workout,
              exercise_type: exercise_type,
            )
          else
            # some type of error message?
            return context.fail!
          end

          context.fail! unless new_exercise.save!
          context.exercise = new_exercise
        end
      end

      private

      attr_reader :exercise_form, :exercise_type, :category, :workout
    end
  end
end
