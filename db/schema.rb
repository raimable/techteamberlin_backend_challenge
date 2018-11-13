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

ActiveRecord::Schema.define(version: 20181112172725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.string "mission_identifier", null: false
    t.string "wikipedia"
    t.string "website"
    t.string "twitter"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payloads", force: :cascade do |t|
    t.bigint "mission_id"
    t.string "payload_identifier", null: false
    t.boolean "reused"
    t.string "manufacturer"
    t.string "payload_type"
    t.float "mass_kg"
    t.float "mass_lbs"
    t.string "orbit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nationality_id"
    t.index ["mission_id"], name: "index_payloads_on_mission_id"
    t.index ["nationality_id"], name: "index_payloads_on_nationality_id"
  end

  add_foreign_key "payloads", "missions"
  add_foreign_key "payloads", "nationalities"
end
