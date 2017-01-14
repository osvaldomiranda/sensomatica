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

ActiveRecord::Schema.define(version: 20170114161517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "descripcion"
    t.text     "caracteristicas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", force: true do |t|
    t.integer  "equipment_id"
    t.integer  "humedad_origen1"
    t.integer  "humedad_origen2"
    t.integer  "humedad_origen3"
    t.integer  "temperatura_origen"
    t.decimal  "humedad1"
    t.decimal  "humedad2"
    t.decimal  "humedad3"
    t.decimal  "temperatura"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name"
    t.string   "file"
    t.string   "codigoe"
  end

  add_index "readings", ["equipment_id"], name: "index_readings_on_equipment_id", using: :btree

end