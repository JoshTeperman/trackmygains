# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_064302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardio_exercises", force: :cascade do |t|
    t.string "name"
    t.integer "total_time"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.float "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cardio_exercises_workouts", id: false, force: :cascade do |t|
    t.bigint "cardio_exercise_id", null: false
    t.bigint "workout_id", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "exercisable_type", null: false
    t.bigint "exercisable_id", null: false
    t.index ["exercisable_type", "exercisable_id"], name: "index_exercises_on_exercisable_type_and_exercisable_id"
  end

  create_table "resistance_exercises", force: :cascade do |t|
    t.string "name"
    t.string "target"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resistance_exercises_workouts", id: false, force: :cascade do |t|
    t.bigint "resistance_exercise_id", null: false
    t.bigint "workout_id", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string "state", default: "started"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
