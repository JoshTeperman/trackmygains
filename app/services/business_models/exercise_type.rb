module BusinessModels
  class ExerciseType
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name
    attribute :targets
    attribute :category

    validates_presence_of :name, :category
    validate :unique?

    def initialize(args = {})
      super
      self.name = self.name&.downcase
    end

    private

    def unique?
      errors.add(:base, 'Exercise Type already exists') if ::ExerciseType.find_by(name: name, category: category).present?
    end
  end
end
