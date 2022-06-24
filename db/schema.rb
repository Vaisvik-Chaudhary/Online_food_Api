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

ActiveRecord::Schema[7.0].define(version: 2022_06_23_104739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cartitems", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cartitems_on_cart_id"
    t.index ["item_id"], name: "index_cartitems_on_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "cart_obj"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_items", id: false, force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "item_id", null: false
    t.index ["cart_id", "item_id"], name: "index_carts_items_on_cart_id_and_item_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "deliveryman_name"
    t.string "deliveryman_city"
    t.string "deliveryman_number"
    t.boolean "delivery_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "deliveryman_email"
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_price"
    t.string "item_category"
    t.string "item_status"
    t.text "item_description"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_secure_url"
    t.index ["restaurant_id"], name: "index_items_on_restaurant_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "orders", force: :cascade do |t|
    t.text "address"
    t.integer "restaurant_id"
    t.string "status", default: "false"
    t.integer "item_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "order_obj"
    t.bigint "user_id", null: false
    t.bigint "delivery_id", null: false
    t.integer "total_price"
    t.text "restaurant_address"
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "restaurant_address"
    t.string "restaurant_contact_number"
    t.text "restaurant_description"
    t.string "restaurant_city"
    t.string "restaurant_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "status", default: false
    t.string "secure_url"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rating"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.bigint "restaurant_id"
    t.bigint "item_id"
    t.bigint "user_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "contact_number"
    t.string "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cartitems", "carts"
  add_foreign_key "cartitems", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "deliveries", "users"
  add_foreign_key "items", "restaurants"
  add_foreign_key "orders", "deliveries"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurants", "users"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
