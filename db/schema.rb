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

ActiveRecord::Schema.define(version: 20151201200530) do

  create_table "cities", force: :cascade do |t|
    t.string "name",      limit: 255
    t.string "country",   limit: 255
    t.string "continent", limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "website",    limit: 255
    t.integer  "venue_id",   limit: 4
    t.integer  "city_id",    limit: 4
    t.string   "image",      limit: 255
  end

  add_index "events", ["city_id"], name: "index_events_on_city_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name",   limit: 255
    t.string "street", limit: 255
    t.string "zip",    limit: 255
  end

  add_foreign_key "events", "cities"
  add_foreign_key "events", "venues"
end
