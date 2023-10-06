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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_073933) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.bigint "action_id", null: false
    t.boolean "completed"
    t.integer "day_of_week"
    t.integer "week_number"
    t.integer "times_completed"
    t.date "completed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_achievements_on_action_id"
  end

  create_table "actions", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.string "content"
    t.integer "times_set"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_actions_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ideal_self_1"
    t.string "ideal_self_2"
    t.string "ideal_self_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "day_of_week", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.datetime "task_time"
    t.string "to_do"
    t.text "memo"
    t.boolean "goal_select", default: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.boolean "first_login", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "achievements", "actions"
  add_foreign_key "actions", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "schedules", "users"
  add_foreign_key "tasks", "schedules"
end
