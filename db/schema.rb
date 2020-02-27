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

ActiveRecord::Schema.define(version: 20200221121409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_hashes", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_hashes_nodes", id: false, force: :cascade do |t|
    t.bigint "data_node_id", null: false
    t.bigint "data_hash_id", null: false
  end

  create_table "data_nodes", force: :cascade do |t|
    t.string "address"
    t.string "fingerprint"
    t.datetime "last_heartbeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.bigint "data_node_id"
    t.bigint "data_hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_hash_id"], name: "index_links_on_data_hash_id"
    t.index ["data_node_id"], name: "index_links_on_data_node_id"
  end

  add_foreign_key "links", "data_hashes"
  add_foreign_key "links", "data_nodes"
end
