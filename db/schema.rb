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

ActiveRecord::Schema.define(version: 20160307070050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "scenario_id"
    t.integer  "option_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type_in"
    t.string   "date"
  end

  add_index "answers", ["option_id"], name: "index_answers_on_option_id", using: :btree
  add_index "answers", ["scenario_id"], name: "index_answers_on_scenario_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "closets", id: false, force: :cascade do |t|
    t.integer  "outfit_id"
    t.integer  "item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "x_coordinate"
    t.float    "y_coordinate"
    t.float    "width"
    t.float    "height"
  end

  add_index "closets", ["item_id"], name: "index_closets_on_item_id", using: :btree
  add_index "closets", ["outfit_id", "item_id"], name: "index_closets_on_outfit_id_and_item_id", unique: true, using: :btree
  add_index "closets", ["outfit_id"], name: "index_closets_on_outfit_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "dress_me_for"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "picture"
    t.string   "price"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "link"
  end

  create_table "options", force: :cascade do |t|
    t.string   "possible_response"
    t.integer  "event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "question_type"
  end

  add_index "options", ["event_id"], name: "index_options_on_event_id", using: :btree

  create_table "outfits", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "stylist_id"
    t.integer  "styled_id"
  end

  add_index "outfits", ["user_id"], name: "index_outfits_on_user_id", using: :btree

  create_table "scenarios", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scenarios", ["user_id"], name: "index_scenarios_on_user_id", using: :btree

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
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "bio"
    t.string   "age"
    t.string   "style_likes"
    t.string   "style_dislikes"
    t.string   "style_icon"
    t.string   "event_location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "options"
  add_foreign_key "answers", "scenarios"
  add_foreign_key "authentications", "users"
  add_foreign_key "closets", "items"
  add_foreign_key "closets", "outfits"
  add_foreign_key "options", "events"
  add_foreign_key "outfits", "users"
  add_foreign_key "scenarios", "users"
end
