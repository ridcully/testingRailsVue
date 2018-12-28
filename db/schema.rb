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

ActiveRecord::Schema.define(version: 2018_12_28_173601) do

  create_table "locations", force: :cascade do |t|
    t.string "Name"
    t.string "Street"
    t.string "AdditionStreet"
    t.string "City"
    t.string "PostCode"
    t.string "Province"
    t.string "Country"
    t.float "Latitude"
    t.float "Longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "Title"
    t.text "Note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Link"
  end

  create_table "notes_tags", id: false, force: :cascade do |t|
    t.integer "note_id", null: false
    t.integer "tag_id", null: false
    t.index ["note_id"], name: "index_notes_tags_on_note_id"
    t.index ["tag_id"], name: "index_notes_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
