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

ActiveRecord::Schema.define(version: 20170411115512) do

  create_table "contacts", force: :cascade do |t|
    t.integer "player_id"
    t.integer "merchant_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "size"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "inventory_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  create_table "items", force: :cascade do |t|
    t.string "type"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "x_position"
    t.integer "y_position"
  end

  create_table "merchants", force: :cascade do |t|
    t.string  "name"
    t.integer "location_id"
    t.string  "type"
  end

  create_table "paths", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "neighbor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "distance"
    t.index ["location_id", "neighbor_id"], name: "index_paths_on_location_id_and_neighbor_id", unique: true
    t.index ["location_id"], name: "index_paths_on_location_id"
    t.index ["neighbor_id"], name: "index_paths_on_neighbor_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_id"
    t.float    "points"
    t.integer  "money",                  default: 0
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
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "stock_orders", force: :cascade do |t|
    t.integer "merchant_id"
    t.string  "merchant_type"
    t.integer "size"
  end

  create_table "stock_rules", force: :cascade do |t|
    t.integer "stock_order_id"
    t.integer "item_id"
    t.integer "price"
    t.integer "restock"
  end

  create_table "upgrade_shops", force: :cascade do |t|
    t.string  "name"
    t.integer "location_id"
  end

end
