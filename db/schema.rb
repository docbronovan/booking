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

ActiveRecord::Schema.define(version: 20150831183336) do

  create_table "bands", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "city"
    t.integer  "members"
    t.string   "instrumets"
    t.text     "description"
    t.string   "genre"
    t.string   "requirements"
    t.string   "text"
    t.string   "soundcloud"
    t.string   "facebook"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bands", ["user_id"], name: "index_bands_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "venue_id"
    t.string   "title"
    t.date     "date"
    t.string   "twentyOne"
    t.integer  "cover"
    t.string   "stage"
    t.text     "equipment"
    t.text     "description"
    t.text     "other"
    t.text     "disclaimer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["band_id"], name: "index_events_on_band_id"
  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "slots", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "band_id"
    t.time     "time"
    t.boolean  "approved",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "slots", ["band_id"], name: "index_slots_on_band_id"
  add_index "slots", ["event_id"], name: "index_slots_on_event_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role",                   default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venues", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "neighborhood"
    t.string   "phone"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id"

end
