# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180719025035) do

  create_table "details", force: :cascade do |t|
    t.integer "task_has_spot_id"
    t.string "photo"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_has_spot_id"], name: "index_details_on_task_has_spot_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer "task_has_spot_id"
    t.string "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_has_spot_id"], name: "index_observations_on_task_has_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.integer "clean_type"
    t.string "governance"
    t.string "lat"
    t.string "long"
    t.integer "status"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_spots_on_deleted_at"
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "task_has_spots", force: :cascade do |t|
    t.integer "spot_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_task_has_spots_on_spot_id"
    t.index ["task_id"], name: "index_task_has_spots_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "period"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tasks_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.string "name", null: false
    t.string "registration", null: false
    t.string "email", null: false
    t.integer "role", null: false
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index [nil], name: "index_users_on_confirmation_token", unique: true
  end

end
