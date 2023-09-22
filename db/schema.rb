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

ActiveRecord::Schema[7.0].define(version: 2023_09_20_015945) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "category_id"
    t.string "phone"
    t.string "wechat"
    t.integer "user_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "show_type"
  end

  create_table "assets", force: :cascade do |t|
    t.string "type", comment: "类别（单表继承）"
    t.string "owner_type", comment: "所属对象"
    t.integer "owner_id", comment: "所属对象id"
    t.integer "position", comment: "排序"
    t.string "file", comment: "附件"
    t.string "file_name", comment: "文件名"
    t.integer "file_size", comment: "文件大小"
    t.string "user_type", comment: "所属用户类型"
    t.integer "user_id", comment: "所属用户id"
    t.string "protect_token", comment: "删除token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width"
    t.integer "height"
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id"
    t.index ["position"], name: "index_assets_on_position"
    t.index ["type"], name: "index_assets_on_type"
  end

  create_table "categories", force: :cascade do |t|
    t.string "type"
    t.string "logo"
    t.string "name"
    t.integer "position"
    t.integer "items_count"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.integer "verified_state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "number"
    t.integer "tower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "avatar_url"
    t.integer "gender"
    t.string "phone"
    t.string "open_id"
    t.string "unionid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login_name"
    t.string "password_digest"
    t.integer "role"
    t.string "type"
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "unit"
    t.string "grade"
    t.string "english"
    t.string "chinese"
    t.integer "vocabulary_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vocabulary_dictation_logs", force: :cascade do |t|
    t.integer "user_id"
    t.jsonb "right"
    t.jsonb "wrong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
