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

ActiveRecord::Schema.define(version: 20150401203607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counters", force: :cascade do |t|
    t.date     "date"
    t.float    "gas"
    t.float    "cold_water"
    t.float    "hot_water"
    t.float    "electricity"
    t.float    "heat"
    t.float    "phone"
    t.float    "cleaning"
    t.float    "speaker"
    t.string   "comment"
    t.integer  "tariff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "counters", ["tariff_id"], name: "index_counters_on_tariff_id", using: :btree

  create_table "tariffs", force: :cascade do |t|
    t.float    "gas"
    t.float    "cold_water"
    t.float    "hot_water"
    t.float    "hot_water_sink"
    t.float    "electricity"
    t.string   "comment"
    t.date     "tariff_started"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "counters", "tariffs"
end
