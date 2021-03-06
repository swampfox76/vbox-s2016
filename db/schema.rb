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

ActiveRecord::Schema.define(version: 20160421221454) do

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "eid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "time"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["employee_id"], name: "index_locations_on_employee_id"

  create_table "obds", force: :cascade do |t|
    t.datetime "time"
    t.decimal  "rpm"
    t.decimal  "mph"
    t.decimal  "throttle"
    t.decimal  "intake_air_temp"
    t.decimal  "fuel_status"
    t.integer  "employee_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "obds", ["employee_id"], name: "index_obds_on_employee_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "time"
    t.integer  "employee_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "dash_video_file_name"
    t.string   "dash_video_content_type"
    t.integer  "dash_video_file_size"
    t.datetime "dash_video_updated_at"
  end

  add_index "videos", ["employee_id"], name: "index_videos_on_employee_id"

end
