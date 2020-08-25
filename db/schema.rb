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

ActiveRecord::Schema.define(version: 2020_08_25_142301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "calisthenics_exercises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cardio_exercises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "total_time"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.float "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "weight"
    t.integer "goal_reps"
    t.integer "reps"
    t.uuid "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
  end

  create_table "exercise_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "targets", array: true
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "exercisable_type", null: false
    t.uuid "exercisable_id", null: false
    t.uuid "exercise_type_id", null: false
    t.uuid "workout_id", null: false
    t.index ["exercisable_type", "exercisable_id"], name: "index_exercises_on_exercisable_type_and_exercisable_id"
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "resistance_exercises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workouts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string "state", default: "started"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercises", "exercise_types"
  add_foreign_key "exercises", "workouts"
end
