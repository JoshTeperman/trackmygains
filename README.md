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
- workouts
  - start_time: datetime
  - finish_time: datetime
  - state: enum (:started, :complete, :deleted)
  - exercises[]
    - exercisable_type
    - exercisable_id
    - resistance_exercises[]
      - name: string
      - target: enum (:back, :chest, :shoulders, :legs, :core, :biceps, :triceps, :lats)
      > target can be multiple
    - cardio_exercises[]
      - name: string
      - start_time: datetime
      - finish_time: datetime
      - total_time: integer(seconds)
      - distance: decimal(km)


class Workouts < ApplicationRecord
  has_and_belongs_to_many :exercises
  has_many :resistance_exercises, through: :exercises, source: :exercisable, source_type: 'ResistanceExercise'
  has_many :cardio_exercises, through: :exercises, source: :exercisable, source_type: 'CardioExercise'
end

class Exercise < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
  has_and_belongs_to_many :workouts
end

class CardioExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
end

class ResistanceExercise < ApplicationRecord
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

