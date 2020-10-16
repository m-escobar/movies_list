# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", id: :integer, default: nil, force: :cascade do |t|
    t.string "title", limit: 16
  end

  create_table "movies", id: :integer, default: -> { "nextval('movie_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title", limit: 128
    t.string "genres", limit: 256
  end

  create_table "occupations", id: :integer, default: nil, force: :cascade do |t|
    t.string "title", limit: 32
  end

  create_table "ratings", id: :integer, default: -> { "nextval('rating_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "rating", limit: 2
    t.datetime "created_at"
    t.index ["movie_id", "user_id"], name: "movie_id_user_id", unique: true
  end

  create_table "users", id: :integer, default: -> { "nextval('user_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "gender", limit: 1
    t.integer "age_id", limit: 2
    t.integer "occupation_id", limit: 2
    t.string "zipcode", limit: 16
  end

end
