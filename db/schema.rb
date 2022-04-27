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

ActiveRecord::Schema.define(version: 2022_03_01_075844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", comment: "附件表", force: :cascade do |t|
    t.string "type", comment: "类别（单表继承）"
    t.string "owner_type", comment: "所属对象"
    t.integer "owner_id", comment: "所属对象id"
    t.integer "position", comment: "排序"
    t.string "file", comment: "附件"
    t.string "file_name", comment: "文件名"
    t.integer "file_size", comment: "文件大小"
    t.string "protect_token", comment: "删除token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id"
    t.index ["type"], name: "index_assets_on_type"
  end

  create_table "categories", force: :cascade do |t|
    t.string "type"
    t.string "logo"
    t.string "name"
    t.integer "position"
    t.integer "items_count"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.integer "verified_state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "number"
    t.integer "tower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", comment: "邮箱"
    t.string "password_digest"
    t.string "nickname"
    t.string "wechat_id", comment: "wechat_id"
    t.jsonb "wechat_profile", comment: "wechat_profile"
    t.string "description", comment: "描述"
    t.string "code"
    t.datetime "code_at"
    t.string "auth_token", comment: "api token"
    t.integer "state", comment: "状态"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
