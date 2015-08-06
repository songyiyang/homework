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

ActiveRecord::Schema.define(version: 20150806163608) do

  create_table "answers", force: :cascade do |t|
    t.text     "content",              null: false
    t.integer  "assigned_homework_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "answers", ["assigned_homework_id"], name: "index_answers_on_assigned_homework_id"

  create_table "assigned_homeworks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "homework_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assigned_homeworks", ["homework_id"], name: "index_assigned_homeworks_on_homework_id"
  add_index "assigned_homeworks", ["user_id"], name: "index_assigned_homeworks_on_user_id"

  create_table "homeworks", force: :cascade do |t|
    t.string   "subject",    null: false
    t.text     "content",    null: false
    t.datetime "due_date",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "homeworks", ["subject"], name: "index_homeworks_on_subject", unique: true
  add_index "homeworks", ["user_id"], name: "index_homeworks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.integer  "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
