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

ActiveRecord::Schema[7.0].define(version: 2023_03_20_135421) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "kid_id", null: false
    t.string "bowel_movement"
    t.integer "nap_duration"
    t.bigint "user_id", null: false
    t.datetime "date"
    t.string "snack"
    t.string "snack_consumption"
    t.string "lunch"
    t.string "lunch_consumption"
    t.string "overall_mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_activities_on_kid_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "kid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_chatrooms_on_kid_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "kid_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_parents_on_kid_id"
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "kid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_rooms_on_kid_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.bigint "kid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_tags_on_kid_id"
    t.index ["photo_id"], name: "index_tags_on_photo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "teacher"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "kids"
  add_foreign_key "activities", "users"
  add_foreign_key "announcements", "users"
  add_foreign_key "chatrooms", "kids"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "parents", "kids"
  add_foreign_key "parents", "users"
  add_foreign_key "rooms", "kids"
  add_foreign_key "rooms", "users"
  add_foreign_key "tags", "kids"
  add_foreign_key "tags", "photos"
end
