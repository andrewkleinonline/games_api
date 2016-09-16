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

ActiveRecord::Schema.define(version: 20160916145526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consoles", force: :cascade do |t|
    t.string   "name"
    t.date     "release_date"
    t.string   "manufacturer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "consoles_video_games", id: false, force: :cascade do |t|
    t.integer "video_game_id", null: false
    t.integer "console_id",    null: false
  end

  create_table "video_games", force: :cascade do |t|
    t.string   "title"
    t.date     "release_date"
    t.string   "developer"
    t.string   "publisher"
    t.string   "genre"
    t.boolean  "series"
    t.integer  "review_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
