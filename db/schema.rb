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

ActiveRecord::Schema.define(version: 20200112144658) do

  create_table "ariadne_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "phase_number"
    t.string   "message_category"
    t.string   "message_or_quote"
    t.string   "author"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "project_name"
    t.integer  "project_version"
    t.text     "project_summary"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "the_initial_blob_to_parse"
    t.text     "the_final_blob_from_the_final_phase"
    t.integer  "current_phase"
  end

  create_table "task_scores", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "necessary_or_optional_for_form_rendering"
    t.float    "necessary_or_optional_score"
    t.string   "quick_or_slow_for_form_rendering"
    t.float    "quick_or_slow_score"
    t.string   "easy_or_hard_for_form_rendering"
    t.float    "easy_or_hard_score"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "the_action_description"
    t.string   "comment_or_measure"
    t.string   "segment"
    t.float    "base_rank"
    t.float    "calculated_rank"
    t.float    "user_rank"
    t.string   "golem"
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "email"
    t.string   "first_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
