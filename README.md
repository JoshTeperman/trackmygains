/workouts :new, :create, :show, :edit, :update, :destroy
/completed_workouts :create, :show, :index, :edit, :update, :destroy
/deleted_workouts :create, :index, :update

/workouts/:id/exercises/:id/set
/workouts/:id/exercises
/workouts

/stats/activity?period=month
/stats/exercises/:id

/sign_in
/sign_up
/profile
/profile/edit

Resources
- Workouts
  - start_time: datetime
  - finish_time: datetime
  - location: enum (:gym, :outside, :home)
  - longitude: decimal
  - latitude: decimal
  - state: enum (:started, :complete, :paused, :cancelled, :deleted_workouts)
  - Exercises[]
    - exercisable_type
    - exercisable_id
    - ResistanceExercises[]
      - type: ExerciseType
    - CardioExercises[]
      - type: ExerciseType
      - start_time: datetime
      - finish_time: datetime
      - total_time: integer(seconds)
      - distance: decimal(km)
    - CalisthenicExercises[]
      - type: ExerciseType

    - ExerciseType
      - name: string
      - category: enum (:calisthenic, :resistance, :cardio)
      - targets: Array[:back, :chest, :shoulders, :legs, :core, :biceps, :triceps, :lats]

class Workouts < ApplicationRecord
  has_and_belongs_to_many :exercise_types
  has_many :exercises
  has_many :resistance_exercises, through: :exercises, source: :exercisable, source_type: 'ResistanceExercise'
  has_many :cardio_exercises, through: :exercises, source: :exercisable, source_type: 'CardioExercise'
  has_many :calisthenics_exercises, through: :exercises, source: :exercisable, source_type: 'CalisthenicsExercise'
end

class ExerciseType < ApplicationRecord
  has_and_belongs_to_many :workouts
end

class Exercise < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
  belongs_to :workout
  belongs_to :exercise_type
end

class CardioExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
end

class ResistanceExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
end

class CalisthenicExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
end


Day 1
Workout 1
  - Date: 11/11/2010
  - Location: gym
  - Exercise 1: Pull-up
    - Set 1
      - Reps * 3
    - Set 2
      - Reps * 3
  - Exercise 2: Pushup
    - Set 1
      Reps * 20
  - Exercise 3: Row
    - Time: 30 minutes
    - Distance: 2.5 km


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
