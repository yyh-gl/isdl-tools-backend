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

ActiveRecord::Schema.define(version: 20180616203118) do

  create_table "lives", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "date"
    t.integer "like", default: 0
    t.string "location"
    t.integer "cd_price"
    t.text "message"
    t.datetime "next_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "open", default: false
  end

  create_table "musics", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.integer "genre", default: 0
    t.integer "like", default: 0
    t.boolean "intro", default: false
    t.boolean "cross", default: false
    t.text "text", default: "hoge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "upload", default: false
    t.string "path"
    t.integer "user_id", default: 0
  end

  create_table "user_cross_musics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "music_id"
    t.boolean "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_musics", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "artist"
    t.integer "genre"
    t.boolean "favorite", default: false
    t.integer "like", default: 0
    t.boolean "intro", default: false
    t.boolean "cross", default: false
    t.boolean "flag1", default: false
    t.boolean "flag2", default: false
    t.boolean "flag3", default: false
    t.text "text", default: "hoge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "music_id"
    t.string "local_path"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id", default: "4679b5b181a7b64e9d26"
    t.integer "age", default: 0
    t.integer "sex", default: 0
    t.integer "job", default: 0
    t.string "area", default: "none"
    t.string "password", default: "hoge"
    t.text "text", default: "hoge"
    t.boolean "artist", default: false
    t.integer "like", default: 0
    t.integer "live_like", default: 0
    t.boolean "cross", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
