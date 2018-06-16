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

ActiveRecord::Schema.define(version: 20180616063741) do

  create_table "users", force: :cascade do |t|
    t.string "user_id", default: "b6d82bd2e214e0b45068"
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
