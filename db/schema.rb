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

ActiveRecord::Schema.define(version: 20171007130745) do

  create_table "monster_data", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "hp"
    t.integer "attack"
    t.integer "defence"
    t.integer "speed"
    t.integer "hp_add"
    t.integer "attack_add"
    t.integer "defence_add"
    t.integer "speed_add"
    t.integer "level"
    t.integer "exp"
    t.integer "tech1"
    t.integer "tech2"
    t.integer "tech3"
    t.integer "tech4"
    t.integer "region_id"
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_details", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "attack"
    t.integer "defence"
    t.integer "speed"
    t.integer "hp_add"
    t.integer "attack_add"
    t.integer "defence_add"
    t.integer "speed_add"
    t.integer "level"
    t.integer "exp"
    t.integer "tech1"
    t.integer "tech2"
    t.integer "tech3"
    t.integer "tech4"
    t.string "type"
    t.integer "user_id"
    t.integer "monster_id"
    t.integer "have_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "hp"
    t.integer "attack"
    t.integer "defence"
    t.integer "speed"
    t.integer "hp_add"
    t.integer "attack_add"
    t.integer "defence_add"
    t.integer "speed_add"
    t.integer "level"
    t.integer "exp"
    t.integer "tech1"
    t.integer "tech2"
    t.integer "tech3"
    t.integer "tech4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teches", force: :cascade do |t|
    t.string "name"
    t.integer "pp"
    t.integer "power"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image_name"
    t.integer "ball_num"
    t.integer "level"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

end
