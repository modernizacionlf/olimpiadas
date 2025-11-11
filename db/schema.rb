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

ActiveRecord::Schema[8.0].define(version: 2025_11_11_135500) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.date "date_of"
    t.time "start_at"
    t.time "end_at"
    t.integer "place_id", null: false
    t.integer "activity_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["place_id"], name: "index_activities_on_place_id"
  end

  create_table "activity_teams", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "student_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_teams_on_activity_id"
    t.index ["student_team_id"], name: "index_activity_teams_on_student_team_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "culturals", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_instances", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "game_instance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "result_a"
    t.integer "result_b"
    t.integer "sport_id", null: false
    t.index ["game_instance_id"], name: "index_games_on_game_instance_id"
    t.index ["sport_id"], name: "index_games_on_sport_id"
  end

  create_table "institutes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_institutes_on_name", unique: true
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_places_on_name", unique: true
  end

  create_table "promos", force: :cascade do |t|
    t.integer "institute_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institute_id"], name: "index_promos_on_institute_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_teams", force: :cascade do |t|
    t.integer "institute_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institute_id"], name: "index_student_teams_on_institute_id"
    t.index ["student_id"], name: "index_student_teams_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "age", null: false
    t.integer "institute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delegate", default: false
    t.integer "promo_id", null: false
    t.index ["institute_id"], name: "index_students_on_institute_id"
    t.index ["promo_id"], name: "index_students_on_promo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "places"
  add_foreign_key "activity_teams", "activities"
  add_foreign_key "activity_teams", "student_teams"
  add_foreign_key "games", "game_instances"
  add_foreign_key "games", "sports"
  add_foreign_key "promos", "institutes"
  add_foreign_key "sessions", "users"
  add_foreign_key "student_teams", "institutes"
  add_foreign_key "student_teams", "students"
  add_foreign_key "students", "institutes"
  add_foreign_key "students", "promos"
end
