/workouts/:id/exercises/:id/set
/workouts/:id/exercises
/workouts

/sign_in
/sign_up
/profile
/profile/edit

Resources
- workouts
  - start_time
  - finish_time
  - state :started, :complete, :deleted
  - exercises[]
    - name
    - exercisable_type
    - exercisable_id
    - sets[]
      - weight :integer
      - reps :integer

- CardioExercise (polymorphic -> Cardio, Resistance has_many :exercises, as: :exercisable) "rowing.exercises"; "squats.exercises"
  - name

- ResistanceExercise
  - name
  - target :cardio, :back, :chest, :shoulders, :legs, :core, :biceps, :triceps, :lats

class Exercise < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
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

Stats

/stats/activity?period=month
/stats/exercises/:id
