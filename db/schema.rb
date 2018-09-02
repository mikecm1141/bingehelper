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

ActiveRecord::Schema.define(version: 20180902030542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.integer "bingecount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "show_genres", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "show_id"
    t.index ["genre_id"], name: "index_show_genres_on_genre_id"
    t.index ["show_id"], name: "index_show_genres_on_show_id"
  end

  create_table "show_ratings", force: :cascade do |t|
    t.bigint "show_id"
    t.bigint "rating_id"
    t.index ["rating_id"], name: "index_show_ratings_on_rating_id"
    t.index ["show_id"], name: "index_show_ratings_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ratings", "users"
  add_foreign_key "show_genres", "genres"
  add_foreign_key "show_genres", "shows"
  add_foreign_key "show_ratings", "ratings"
  add_foreign_key "show_ratings", "shows"
end
