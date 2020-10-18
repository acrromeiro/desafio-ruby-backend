# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_18_042431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.float "total", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_stores_on_name", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.float "abs_value", null: false
    t.string "cpf", null: false
    t.string "card", null: false
    t.datetime "date_transaction", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "store_id"
    t.bigint "type_transaction_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["type_transaction_id"], name: "index_transactions_on_type_transaction_id"
  end

  create_table "type_transactions", force: :cascade do |t|
    t.integer "external_id"
    t.string "description"
    t.string "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_id"], name: "index_type_transactions_on_external_id", unique: true
  end

  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "type_transactions"
end
