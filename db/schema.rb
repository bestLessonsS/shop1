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

ActiveRecord::Schema.define(version: 20151128105040) do

  create_table "books", force: :cascade do |t|
    t.string   "author"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "books", ["product_id"], name: "index_books_on_product_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "genre"
    t.string   "media"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movies", ["product_id"], name: "index_movies_on_product_id"

  create_table "order_elements", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_elements", ["order_id"], name: "index_order_elements_on_order_id"
  add_index "order_elements", ["product_id"], name: "index_order_elements_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.datetime "orderDate"
    t.datetime "dateShipped"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "amountAvailable"
    t.string   "type"
    t.string   "genre"
    t.string   "media"
    t.string   "author"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "products", ["name"], name: "index_products_on_name"
  add_index "products", ["price"], name: "index_products_on_price"

end