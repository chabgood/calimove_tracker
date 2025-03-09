# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_01_191724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "day_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_day_names_on_name", unique: true
  end

  create_table "days", force: :cascade do |t|
    t.integer "day_name_id"
    t.integer "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_name_id"], name: "index_days_on_day_name_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "day_id"
    t.integer "level_id"
    t.integer "phase_id"
    t.string "number"
    t.string "workout"
    t.integer "workout_name_id"
    t.string "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sets", default: 0
    t.string "rest", limit: 50
    t.string "rest_between_exercises", limit: 50
    t.string "test_result", limit: 10
    t.string "workout_value", limit: 10
    t.text "notes"
    t.index ["day_id"], name: "index_exercises_on_day_id"
    t.index ["level_id"], name: "index_exercises_on_level_id"
    t.index ["phase_id"], name: "index_exercises_on_phase_id"
    t.index ["workout_name_id"], name: "index_exercises_on_workout_name_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_levels_on_number", unique: true
  end

  create_table "phases", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_phases_on_number", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "user_id"], name: "index_schedules_on_title_and_user_id", unique: true
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "number", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_weeks_on_schedule_id"
  end

  create_table "workout_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_workout_names_on_name", unique: true
  end

  add_foreign_key "days", "day_names"
  add_foreign_key "days", "weeks"
  add_foreign_key "exercises", "days"
  add_foreign_key "exercises", "levels"
  add_foreign_key "exercises", "phases"
  add_foreign_key "exercises", "workout_names"
  add_foreign_key "schedules", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "weeks", "schedules"
end
