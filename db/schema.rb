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

ActiveRecord::Schema.define(version: 2018_11_23_072338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.boolean "accepted"
    t.datetime "time_start"
    t.datetime "time_end"
    t.bigint "pup_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pup_id"], name: "index_bookings_on_pup_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "pups", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.string "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images", default: [], array: true
    t.float "lat"
    t.float "long"
    t.index ["user_id"], name: "index_pups_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatarUrl"
    t.string "nickName"
  end

  add_foreign_key "bookings", "pups"
  add_foreign_key "bookings", "users"
  add_foreign_key "pups", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
