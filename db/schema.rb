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

ActiveRecord::Schema[7.1].define(version: 2024_05_27_213640) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tanks", force: :cascade do |t|
    t.string "radioelement"
    t.float "full_capacity"
    t.float "current_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "cin", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wastes", force: :cascade do |t|
    t.string "reg_number"
    t.string "waste_type"
    t.string "radioelement"
    t.string "solid_type"
    t.float "activity"
    t.float "weight"
    t.float "volume"
    t.boolean "infectious", default: false
    t.boolean "eliminated", default: false
    t.datetime "elimination_date"
    t.float "half_life"
    t.float "volumic_activity"
    t.float "risidual_activity"
    t.bigint "tank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tank_id"], name: "index_wastes_on_tank_id"
  end

  add_foreign_key "wastes", "tanks"
end
