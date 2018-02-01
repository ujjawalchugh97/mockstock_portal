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

ActiveRecord::Schema.define(version: 20180201142722) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bfutures", force: :cascade do |t|
    t.integer "stock_id"
    t.string "time"
    t.decimal "buying_price"
    t.decimal "price_per_share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_bfutures_on_stock_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ex_rates", force: :cascade do |t|
    t.integer "m1"
    t.integer "m2"
    t.string "m1c"
    t.string "m2c"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sfutures", force: :cascade do |t|
    t.integer "stock_id"
    t.string "time"
    t.decimal "selling_price"
    t.decimal "price_per_share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_sfutures_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.integer "qty_in_market"
    t.decimal "price"
    t.integer "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_stocks_on_market_id"
  end

  create_table "user_bfuture_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bfuture_id"
    t.integer "no_of_shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bfuture_id"], name: "index_user_bfuture_mappings_on_bfuture_id"
    t.index ["user_id"], name: "index_user_bfuture_mappings_on_user_id"
  end

  create_table "user_sfuture_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sfuture_id"
    t.integer "no_of_shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sfuture_id"], name: "index_user_sfuture_mappings_on_sfuture_id"
    t.index ["user_id"], name: "index_user_sfuture_mappings_on_user_id"
  end

  create_table "user_short_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.integer "no_of_shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amt"
    t.index ["stock_id"], name: "index_user_short_mappings_on_stock_id"
    t.index ["user_id"], name: "index_user_short_mappings_on_user_id"
  end

  create_table "user_stock_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.integer "no_of_shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "investment"
    t.index ["stock_id"], name: "index_user_stock_mappings_on_stock_id"
    t.index ["user_id"], name: "index_user_stock_mappings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nameteam", default: "", null: false
    t.string "namep1", default: "", null: false
    t.string "namep2"
    t.string "contactp1", default: "", null: false
    t.string "contactp2"
    t.decimal "balance1", default: "500000.0"
    t.decimal "balance2", default: "500000.0"
    t.decimal "balance3", default: "500000.0"
    t.decimal "balance4", default: "500000.0"
    t.decimal "balance_nc1", default: "0.0"
    t.decimal "balance_nc2", default: "0.0"
    t.decimal "balance_nc3", default: "0.0"
    t.decimal "balance_nc4", default: "0.0"
    t.decimal "investment_nc1", default: "0.0"
    t.decimal "investment_nc2", default: "0.0"
    t.decimal "investment_nc3", default: "0.0"
    t.decimal "investment_nc4", default: "0.0"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
