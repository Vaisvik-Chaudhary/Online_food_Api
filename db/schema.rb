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

ActiveRecord::Schema[7.0].define(version: 2022_06_15_153956) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_items", id: false, force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "item_id", null: false
    t.index ["cart_id", "item_id"], name: "index_carts_items_on_cart_id_and_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_price"
    t.string "item_category"
    t.string "item_status"
    t.text "item_description"
    t.bigint "restaurants_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_items_on_restaurants_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "restaurant_address"
    t.integer "restaurant_contact_number"
    t.text "restaurant_description"
    t.string "restaurant_city"
    t.string "restaurant_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userdetails", force: :cascade do |t|
    t.string "username"
    t.string "user_address"
    t.integer "user_contact_number"
    t.string "user_city"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_userdetails_on_user_id"
    t.index ["username"], name: "index_userdetails_on_username", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cartitems", "carts"
  add_foreign_key "cartitems", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "items", "restaurants", column: "restaurants_id"
  add_foreign_key "userdetails", "users"
end
