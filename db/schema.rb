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

ActiveRecord::Schema.define(version: 20171012010339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact", id: :serial, comment: "This is the Renee's Garden id number.  The Cornucopia id number is in id_CS in case of confilicts between RG and CS", force: :cascade, comment: "Stores Company, Customers, Reps, etc.  " do |t|
    t.string "name", limit: 100, default: "", null: false
    t.string "storenum", limit: 25, default: "", null: false
    t.string "address", limit: 100, default: "", null: false
    t.string "suite", limit: 100, default: "", null: false
    t.string "city", limit: 100, default: "", null: false
    t.string "state_code", limit: 2, default: "", null: false
    t.string "zip", limit: 25, default: "", null: false
    t.string "email", limit: 100, default: "", null: false
    t.string "phone", limit: 25, default: "", null: false
    t.bigint "contact_type", default: 0, null: false, comment: "bitmap value for info about customer type, i.e. rep, company, customer, active, inactive, etc."
    t.integer "billto_id", default: 0, null: false
    t.integer "rep_id", default: 0, null: false
    t.integer "id_cs", default: 0, null: false
  end

  create_table "order_item", id: false, force: :cascade do |t|
    t.integer "id", null: false
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "qty_order", null: false
    t.integer "qty_ship", null: false
    t.decimal "cost", precision: 18, scale: 2, null: false
    t.decimal "retail", precision: 18, scale: 2, null: false
  end

  create_table "order_shipment", id: :integer, default: nil, force: :cascade do |t|
    t.integer "order_id", null: false
    t.date "ship_date", null: false
    t.string "tracking_number", limit: 50, null: false
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "ponum", limit: 25, default: "", null: false
    t.date "order_date", default: -> { "('now'::text)::date" }, null: false
    t.date "request_ship_date", default: -> { "('now'::text)::date" }, null: false
    t.date "invoice_date"
    t.decimal "total", precision: 18, scale: 2, default: "0.0", null: false
    t.text "note"
    t.integer "contact_id", null: false
    t.integer "seed_year", default: 0, null: false
  end

  create_table "product", id: :integer, default: nil, force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "name", limit: 50, default: "", null: false
    t.integer "product_type_id", null: false, comment: "equates to packet_type in RG firebird database"
    t.string "upc", default: "", null: false
    t.string "sku", default: "", null: false
    t.integer "product_type_value", default: 1, null: false, comment: "bitwise value for product - i.e. packet, veg, flower, herb, etc."
  end

  create_table "product_price", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "billto_id", null: false
    t.decimal "retail", precision: 18, scale: 2, null: false
    t.decimal "cost", precision: 18, scale: 2, null: false
    t.integer "seed_year", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_users_on_contact_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_item", "orders", name: "fk_orders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "order_item", "product", name: "fk_product", on_update: :cascade, on_delete: :cascade
  add_foreign_key "order_shipment", "orders", name: "order_shipment_order_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "orders", "contact", name: "fk_contact", on_update: :cascade, on_delete: :cascade
  add_foreign_key "product_price", "contact", column: "billto_id", name: "product_price_billto_id_fkey"
  add_foreign_key "product_price", "product", name: "product_price_product_id_fkey"
  add_foreign_key "users", "contact"
end
