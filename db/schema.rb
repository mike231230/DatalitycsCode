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

ActiveRecord::Schema.define(version: 2022_06_16_015723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_segments", force: :cascade do |t|
    t.string "segment"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.bigint "customer_segments_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "geographic_zones_id"
    t.index ["customer_segments_id"], name: "index_customers_on_customer_segments_id"
    t.index ["geographic_zones_id"], name: "index_customers_on_geographic_zones_id"
  end

  create_table "delivery_informations", force: :cascade do |t|
    t.string "product_category"
    t.string "product_sub_category"
    t.bigint "product_containers_id"
    t.index ["product_containers_id"], name: "index_delivery_informations_on_product_containers_id"
  end

  create_table "geographic_zones", force: :cascade do |t|
    t.string "province"
    t.string "region"
  end

  create_table "order_priorities", force: :cascade do |t|
    t.string "priority"
  end

  create_table "orders", force: :cascade do |t|
    t.date "order_date"
    t.integer "quantity"
    t.float "sale"
    t.float "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_priorities_id"
    t.bigint "customers_id"
    t.bigint "shipments_id"
    t.bigint "products_id"
    t.index ["customers_id"], name: "index_orders_on_customers_id"
    t.index ["order_priorities_id"], name: "index_orders_on_order_priorities_id"
    t.index ["products_id"], name: "index_orders_on_products_id"
    t.index ["shipments_id"], name: "index_orders_on_shipments_id"
  end

  create_table "product_containers", force: :cascade do |t|
    t.string "container"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "unit_price"
    t.float "shopping_cost"
    t.float "profit"
    t.float "product_base_margin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "delivery_information_id"
    t.index ["delivery_information_id"], name: "index_products_on_delivery_information_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "ship_mode"
  end

end
