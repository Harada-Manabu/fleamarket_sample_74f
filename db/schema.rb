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

ActiveRecord::Schema.define(version: 2020_05_11_025016) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "categoryName", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["categoryName"], name: "index_categories_on_categoryName"
  end

  create_table "goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "goodsName", null: false
    t.text "explanation", null: false
    t.bigint "category_id", null: false
    t.string "brand"
    t.string "goodsCondition", null: false
    t.string "deliveryFee", null: false
    t.string "deliveryDay", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
    t.index ["brand"], name: "index_goods_on_brand"
    t.index ["category_id"], name: "index_goods_on_category_id"
    t.index ["goodsName"], name: "index_goods_on_goodsName"
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "good_id", null: false
    t.string "goodsImage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_pictures_on_good_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "goods", "categories"
  add_foreign_key "goods", "users"
  add_foreign_key "pictures", "goods"
end
