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

ActiveRecord::Schema.define(version: 2019_06_22_030814) do

  create_table "attachments", force: :cascade do |t|
    t.string "censorship_status"
    t.string "image_url"
    t.string "original_image_url"
    t.integer "e_consult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["censorship_status"], name: "index_attachments_on_censorship_status"
    t.index ["e_consult_id", "censorship_status"], name: "index_attachments_on_e_consult_id_and_censorship_status"
    t.index ["e_consult_id"], name: "index_attachments_on_e_consult_id"
  end

  create_table "e_consults", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redactions", force: :cascade do |t|
    t.float "x_origin"
    t.float "y_origin"
    t.float "height"
    t.float "width"
    t.integer "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_redactions_on_attachment_id"
  end

end
