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

ActiveRecord::Schema.define(version: 20160912180646) do

  create_table "locations", force: :cascade do |t|
  end

  create_table "paths", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "neighbor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id", "neighbor_id"], name: "index_paths_on_location_id_and_neighbor_id", unique: true
    t.index ["location_id"], name: "index_paths_on_location_id"
    t.index ["neighbor_id"], name: "index_paths_on_neighbor_id"
  end

end
