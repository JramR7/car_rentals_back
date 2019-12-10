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

ActiveRecord::Schema.define(version: 2019_12_05_212800) do

  create_table "cars", force: :cascade do |t|
    t.string "property_document"
    t.string "plate"
    t.string "color"
    t.string "model"
    t.string "year"
    t.string "brand"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_cars_on_owner_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "business_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "car_id"
    t.integer "rental_user_id"
    t.integer "trip_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_contracts_on_car_id"
    t.index ["company_id"], name: "index_contracts_on_company_id"
    t.index ["rental_user_id"], name: "index_contracts_on_rental_user_id"
    t.index ["trip_id"], name: "index_contracts_on_trip_id"
  end

  create_table "modified_documents", force: :cascade do |t|
    t.decimal "price"
    t.decimal "lat_destination"
    t.decimal "long_destination"
    t.string "address"
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_modified_documents_on_contract_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "licence"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "rental_users", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rental_users_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.decimal "lat_origin"
    t.decimal "long_origin"
    t.decimal "lat_destination"
    t.decimal "long_destination"
    t.decimal "price"
    t.string "address_origin"
    t.string "address_destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "id_document"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
