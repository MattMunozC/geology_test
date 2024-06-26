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

ActiveRecord::Schema[7.1].define(version: 2024_04_08_231905) do
  create_table "comments", force: :cascade do |t|
    t.integer "datum_id"
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["datum_id"], name: "index_comments_on_datum_id"
  end

  create_table "data", force: :cascade do |t|
    t.string "external_id"
    t.boolean "tsunami"
    t.string "magType"
    t.text "url"
    t.text "place"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "magnitude"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "time"
  end

  add_foreign_key "comments", "data"
end
