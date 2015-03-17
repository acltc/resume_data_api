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

ActiveRecord::Schema.define(version: 20150317011720) do

  create_table "education_details", force: :cascade do |t|
    t.text     "detail",       limit: 65535
    t.integer  "education_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "degree",          limit: 255
    t.string   "university_name", limit: 255
    t.integer  "student_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experience_details", force: :cascade do |t|
    t.text     "detail",        limit: 65535
    t.integer  "experience_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "job_title",    limit: 255
    t.string   "company_name", limit: 255
    t.integer  "student_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name", limit: 255
    t.integer  "student_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "email",         limit: 255
    t.string   "phone_number",  limit: 255
    t.string   "linkedin",      limit: 255
    t.text     "twitter",       limit: 65535
    t.string   "blog",          limit: 255
    t.string   "online_resume", limit: 255
    t.string   "github",        limit: 255
    t.string   "photo",         limit: 255
    t.text     "short_bio",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
