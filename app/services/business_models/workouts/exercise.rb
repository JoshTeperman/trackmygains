module BusinessModels
  module Workouts
    class Exercise
      include ActiveModel::Model
      include ActiveModel::Attributes

      attribute :workout
      attribute :exercise_type
      attribute :category

      validates_presence_of :workout, :exercise_type, :category

      def initialize(args = {})
        super
        self.category ||= self.exercise_type.category
      end
    end
  end
end
