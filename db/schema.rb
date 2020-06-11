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

ActiveRecord::Schema.define(version: 2020_06_10_042922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citizens", force: :cascade do |t|
    t.string "password_digest"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "phone_number"
    t.string "email"
    t.date "birthday"
    t.string "gender"
    t.string "race"
    t.string "state_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "citizen_id"
    t.integer "police_department_id"
    t.text "description"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "police", force: :cascade do |t|
    t.integer "badge_number"
    t.string "name"
    t.string "job_title"
    t.integer "police_department_id"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "police_departments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "police_id"
    t.integer "citizen_id"
    t.string "location"
    t.string "city"
    t.string "state"
    t.date "date"
    t.time "time"
    t.boolean "arrest"
    t.boolean "force_used"
    t.text "reason"
    t.text "incident_description"
    t.text "resolution"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
