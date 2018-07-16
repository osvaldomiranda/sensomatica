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

ActiveRecord::Schema.define(version: 2018_07_10_201948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "astronomic_objects", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "catalog", limit: 255
    t.string "type_object", limit: 255
    t.string "ra", limit: 255
    t.string "dec", limit: 255
    t.string "constellation", limit: 255
    t.float "bmag"
    t.string "hubble", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "coord_ar"
    t.float "coord_dec"
    t.string "sign_dec", limit: 255
    t.string "colloquial_name", limit: 255
    t.string "equivalence", limit: 255
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commands", id: :serial, force: :cascade do |t|
    t.string "command", limit: 255
    t.string "type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", limit: 255
    t.float "ar"
    t.float "dec"
    t.integer "exptime"
    t.integer "iso"
  end

  create_table "equipment", id: :serial, force: :cascade do |t|
    t.string "codigo", limit: 255
    t.string "nombre", limit: 255
    t.text "descripcion"
    t.text "caracteristicas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chatroom_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photo_sessions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "equipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["equipment_id"], name: "index_photo_sessions_on_equipment_id"
    t.index ["user_id"], name: "index_photo_sessions_on_user_id"
  end

  create_table "photos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "equipment_id"
    t.string "photo", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["equipment_id"], name: "index_photos_on_equipment_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "readings", id: :serial, force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "humedad_origen1"
    t.integer "humedad_origen2"
    t.integer "humedad_origen3"
    t.integer "temperatura_origen"
    t.decimal "humedad1"
    t.decimal "humedad2"
    t.decimal "humedad3"
    t.decimal "temperatura"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_name", limit: 255
    t.string "file", limit: 255
    t.string "codigoe", limit: 255
    t.string "humidity_concept1", limit: 255
    t.index ["equipment_id"], name: "index_readings_on_equipment_id"
  end

  create_table "reservs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "equipment_id"
    t.integer "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["equipment_id"], name: "index_reservs_on_equipment_id"
    t.index ["user_id"], name: "index_reservs_on_user_id"
  end

  create_table "type_objects", id: :serial, force: :cascade do |t|
    t.string "type_name", limit: 255
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture", limit: 255
    t.string "fullname", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
