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

ActiveRecord::Schema[7.1].define(version: 2024_05_23_140012) do
  create_table "buffet_profiles", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_buffet_profiles_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buffet_profiles_on_reset_password_token", unique: true
  end

  create_table "buffets", force: :cascade do |t|
    t.string "brand_name", null: false
    t.string "corporation_name", null: false
    t.text "description", null: false
    t.integer "cnpj", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "district", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "cep", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address", null: false
    t.integer "buffet_profile_id", null: false
    t.index ["buffet_profile_id"], name: "index_buffets_on_buffet_profile_id"
  end

  create_table "buffets_payments", id: false, force: :cascade do |t|
    t.integer "buffet_id", null: false
    t.integer "payment_id", null: false
    t.index ["buffet_id", "payment_id"], name: "index_buffets_payments_on_buffet_id_and_payment_id"
    t.index ["payment_id", "buffet_id"], name: "index_buffets_payments_on_payment_id_and_buffet_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "cpf", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buffets", "buffet_profiles"
end
