class Workouts
  has_and_belongs_to_many :exercise_types
  has_many :exercises
  has_many :resistance_exercises, through: :exercises, source: :exercisable, source_type: 'ResistanceExercise'
  has_many :cardio_exercises, through: :exercises, source: :exercisable, source_type: 'CardioExercise'
  has_many :calisthenics_exercises, through: :exercises, source: :exercisable, source_type: 'CalisthenicsExercise'

  attr :start_time, datetime
  attr :finish_time, datetime
  attr :location, enum (:gym, :outside, :home)
  attr :longitude, decimal
  attr :latitude, decimal
  attr :state, enum (:started, :complete, :paused, :cancelled, :deleted_workouts)
end

class ExerciseType
  has_and_belongs_to_many :workouts

  attr :name, string
  attr :category, enum (:calisthenic, :resistance, :cardio)
  attr :targets, array [:back, :chest, :shoulders, :legs, :core, :biceps, :triceps, :lats]
end

class Exercise
  belongs_to :exercisable, polymorphic: true
  belongs_to :workout
  belongs_to :exercise_type
  has_many :sets

  attr :exercisable_type, string
  attr :exercisable_id, uuid
end

class ExerciseSet
  belongs_to :exercise

  attr :weight, integer
  attr :goal_reps, integer
  attr :reps, integer
end

class CardioExercise
  has_many :exercises, as: :exercisable

  attr :start_time, datetime
  attr :finish_time, datetime
  attr :total_time, integer(seconds)
  attr :distance, decimal(km)
end

class ResistanceExercise
  has_many :exercises, as: :exercisable
end

class CalisthenicExercise
  has_many :exercises, as: :exercisable
end

# Features

## Current Workout
Limited to one current workout. Can only create a new workout if there are no other started or paused workouts.
Creating a new workout creates a session cookie that saves the current workout id.

After Login:
  -> if current_workout?
    -> redirect to `current_workout#show`
    -> resume current workout
    -> other options (workouts index etc)
    -> cancel workout
  -> else
    -> redirect to `workouts#new` or some type of home dashboard / stats summary
