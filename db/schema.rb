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

ActiveRecord::Schema[7.1].define(version: 2024_02_14_040029) do
  create_table "daily_plan_tasks", force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "task_id", null: false
    t.datetime "time_slot_start"
    t.datetime "time_slot_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_daily_plan_tasks_on_plan_id"
    t.index ["task_id"], name: "index_daily_plan_tasks_on_task_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "date"
    t.text "summary"
    t.text "action_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.string "priority"
    t.string "status"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer "task_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_time_entries_on_task_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "daily_plan_tasks", "plans"
  add_foreign_key "daily_plan_tasks", "tasks"
  add_foreign_key "reviews", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "time_entries", "tasks"
end
