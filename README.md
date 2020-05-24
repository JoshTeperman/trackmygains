/workouts/:id/exercises/:id/set
/workouts/:id/exercises
/workouts

/sign_in
/sign_up
/profile
/profile/edit

Resources
- workouts
  - start_time: datetime
  - finish_time: datetime
  - state: enum (:started, :complete, :deleted)
  - resistance_exercises[]
    - name: string
    - target: enum (:cardio, :back, :chest, :shoulders, :legs, :core, :biceps, :triceps, :lats)
  - cardio_exercises[]
    - name: string
    - start_time: datetime
    - finish_time: datetime
    - total_time: integer(seconds)
    - distance: decimal(km)

  - exercises[]
    - exercisable_type
    - exercisable_id

class CardioExercisesWorkouts
  belongs_to :cardio_exercises
  belongs_to :workouts
end

class Workouts < ApplicationRecord
  has_many :cardio_exercises
  has_many :resistance_exercises
end

class Exercise < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
end

class CardioExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
  has_many :workouts
end

class ResistanceExercise < ApplicationRecord
  has_many :exercises, as: :exercisable
  has_many :workouts
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

Stats

/stats/activity?period=month
/stats/exercises/:id
