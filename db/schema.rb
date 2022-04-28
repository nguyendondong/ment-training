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

ActiveRecord::Schema.define(version: 2022_04_28_125550) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["user_id"], name: "index_events_users_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "picture"
    t.json "pictures"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "amount"
    t.integer "variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["variant_id"], name: "index_prices_on_variant_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "sku"
    t.string "description"
    t.text "meta_description"
    t.string "meta_keywords"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "pictures"
    t.string "price"
  end

  create_table "products_taxons", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "taxon_id", null: false
    t.index ["product_id"], name: "index_products_taxons_on_product_id"
    t.index ["taxon_id"], name: "index_products_taxons_on_taxon_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", default: "user"
    t.string "destription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxons", force: :cascade do |t|
    t.string "name"
    t.string "meta_title"
    t.string "meta_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

# Could not dump table "users" because of following StandardError
#   Unknown type '' for column 'password'

  create_table "variants", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "sku"
    t.string "color"
    t.string "size"
    t.string "cost_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "pictures"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "prices", "variants"
  add_foreign_key "products_taxons", "products"
  add_foreign_key "products_taxons", "taxons"
  add_foreign_key "users", "roles"
  add_foreign_key "variants", "products"
end
