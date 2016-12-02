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

ActiveRecord::Schema.define(version: 20161201213759) do

  create_table "application_requests", force: :cascade do |t|
    t.integer  "grant_application_id"
    t.string   "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "grant_applications", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_number"
    t.string   "academic_unit"
    t.string   "program"
    t.string   "session_number"
    t.string   "thesis"
    t.integer  "course_count"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "login_id"
    t.string   "password_digest"
    t.integer  "supervisor_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string   "login_id"
    t.string   "password_digest"
    t.string   "employee_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
