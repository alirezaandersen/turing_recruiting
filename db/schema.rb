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

ActiveRecord::Schema.define(version: 20160417211227) do

  create_table "applications", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "applications", ["job_id"], name: "index_applications_on_job_id"
  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "department"
    t.string   "title"
    t.string   "description"
    t.string   "requirements"
    t.integer  "salary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "current_job"
    t.string   "previous_job"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
    t.boolean  "admin"
  end

end
