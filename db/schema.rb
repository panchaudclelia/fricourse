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

ActiveRecord::Schema.define(version: 20170516104133) do

  create_table "belongings", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "course_module_id"
    t.boolean  "mandatory",        default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["course_id"], name: "index_belongings_on_course_id"
    t.index ["course_module_id"], name: "index_belongings_on_course_module_id"
  end

  create_table "course_modules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_modules_study_paths", force: :cascade do |t|
    t.integer  "study_path_id"
    t.integer  "course_module_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["course_module_id"], name: "index_course_modules_study_paths_on_course_module_id"
    t.index ["study_path_id"], name: "index_course_modules_study_paths_on_study_path_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "semester"
    t.string   "name"
    t.string   "name_english"
    t.string   "description"
    t.string   "code"
    t.string   "language"
    t.string   "lecturer"
    t.string   "assistant"
    t.string   "level"
    t.integer  "hours_per_week"
    t.float    "ects"
    t.text     "goals"
    t.string   "references"
    t.string   "frequency"
    t.string   "time_schedule"
    t.string   "number_of_students"
    t.string   "softskill_students"
    t.boolean  "free_auditor"
    t.string   "erasmus_students"
    t.string   "condition"
    t.string   "examination_regulation"
    t.string   "exam_session"
    t.datetime "exam_date"
    t.string   "type_of_evaluation"
    t.string   "exam_duration"
    t.string   "exam_language"
    t.string   "study_program"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_paths", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "study_path"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_courses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_users_courses_on_course_id"
    t.index ["user_id"], name: "index_users_courses_on_user_id"
  end

  create_table "users_study_paths", force: :cascade do |t|
    t.integer  "study_path_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["study_path_id"], name: "index_users_study_paths_on_study_path_id"
    t.index ["user_id"], name: "index_users_study_paths_on_user_id"
  end

end
