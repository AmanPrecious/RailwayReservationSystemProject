# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_30_054419) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "join_train_stations", force: :cascade do |t|
    t.integer "train_id", null: false
    t.integer "station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_join_train_stations_on_station_id"
    t.index ["train_id"], name: "index_join_train_stations_on_train_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "p_name"
    t.integer "p_age"
    t.string "p_gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id", null: false
    t.index ["ticket_id"], name: "index_passengers_on_ticket_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_method"
    t.integer "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_payments_on_ticket_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "class_type"
    t.string "seat_type"
    t.integer "seat_quantity"
    t.integer "train_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_seats_on_train_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "stn_name"
    t.string "stn_location"
    t.string "stn_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "train_id", null: false
    t.string "booking_status"
    t.date "booking_date"
    t.string "from_station"
    t.string "to_station"
    t.string "class_type"
    t.string "seat_type"
    t.string "seat_no"
    t.integer "mobile"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "train_stations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trains", force: :cascade do |t|
    t.integer "train_number"
    t.string "train_name"
    t.string "source_station"
    t.string "destination_station"
    t.datetime "arrival_time"
    t.datetime "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "mobile"
    t.string "address"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "join_train_stations", "stations"
  add_foreign_key "join_train_stations", "trains"
  add_foreign_key "passengers", "tickets"
  add_foreign_key "payments", "tickets"
  add_foreign_key "seats", "trains"
  add_foreign_key "tickets", "trains"
  add_foreign_key "tickets", "users"
end
