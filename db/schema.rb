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

ActiveRecord::Schema.define(version: 201608190700) do

  create_table "local_products", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "shelve_nr"
    t.integer  "packsize"
    t.boolean  "hidden",             default: false, null: false
    t.integer  "supplier_id"
    t.string   "supplier_sku"
    t.string   "supplier_prod_name"
    t.decimal  "purchase_price"
    t.text     "order_info"
    t.boolean  "active",             default: true,  null: false
  end

  add_index "local_products", ["product_id"], name: "index_local_products_on_product_id", unique: true
  add_index "local_products", ["supplier_id"], name: "index_local_products_on_supplier_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",                         null: false
    t.string   "state",            default: "new"
    t.integer  "num_wished"
    t.integer  "num_ordered"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "local_product_id"
    t.integer  "current_stock"
    t.integer  "min_stock"
    t.integer  "num_stocked"
  end

  add_index "order_items", ["local_product_id"], name: "index_order_items_on_local_product_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.string   "state",             default: "new"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "supplier_id"
    t.text     "internal_comment"
    t.text     "public_comment"
    t.text     "order_result"
    t.string   "remote_order_id"
    t.string   "remote_order_link"
    t.string   "order_method"
  end

  add_index "orders", ["supplier_id"], name: "index_orders_on_supplier_id"

  create_table "remote_products", force: :cascade do |t|
    t.string   "name"
    t.integer  "local_product_id"
    t.integer  "product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "supplier_id"
  end

  add_index "remote_products", ["local_product_id"], name: "index_remote_products_on_local_product_id"
  add_index "remote_products", ["supplier_id"], name: "index_remote_products_on_supplier_id"

  create_table "stock_items", force: :cascade do |t|
    t.integer  "local_product_id"
    t.integer  "qty"
    t.datetime "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "stock_items", ["local_product_id"], name: "index_stock_items_on_local_product_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.boolean  "remote_shop",         default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email"
    t.text     "order_template"
    t.integer  "delivery_time_days"
    t.text     "order_info"
    t.decimal  "minimum_order_value"
    t.string   "order_method"
  end

  add_index "suppliers", ["name"], name: "index_suppliers_on_name"

end
