# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161206054146) do

  create_table "application_requests", force: :cascade do |t|
    t.integer  "grant_application_id"
    t.string   "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "student_id"
    t.integer  "supervisor_id"
    t.string   "suggested_changes"
    t.boolean  "advance_requested"
  end

  add_index "application_requests", ["student_id"], name: "index_application_requests_on_student_id"
  add_index "application_requests", ["supervisor_id"], name: "index_application_requests_on_supervisor_id"

  create_table "conferences", force: :cascade do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.string   "website"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.integer  "geographical_zone_id"
  end

  create_table "expense_estimates", force: :cascade do |t|
    t.decimal  "registration"
    t.decimal  "transportation"
    t.decimal  "accomodation"
    t.decimal  "meals"
    t.decimal  "total"
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "justification"
  end

  create_table "geographical_zones", force: :cascade do |t|
    t.string   "category"
    t.decimal  "masters_grant_limit"
    t.decimal  "phd_grant_limit"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "grant_applications", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "conference_id"
  end

  add_index "grant_applications", ["conference_id"], name: "index_grant_applications_on_conference_id"

  create_table "presentations", force: :cascade do |t|
    t.string   "topic"
    t.string   "presentation_format"
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_number"
    t.string   "academic_unit"
    t.string   "program"
    t.string   "session_number"
    t.string   "thesis"
    t.integer  "course_count"
    t.string   "student_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "login_id"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "supervisor_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string   "login_id"
    t.string   "password_digest"
    t.string   "employee_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

end
