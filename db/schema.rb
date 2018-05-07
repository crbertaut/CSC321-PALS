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

ActiveRecord::Schema.define(version: 20180504005635) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests_people", id: false, force: :cascade do |t|
    t.integer "interest_id", null: false
    t.integer "person_id", null: false
    t.index ["interest_id"], name: "index_interests_people_on_interest_id"
    t.index ["person_id"], name: "index_interests_people_on_person_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "phone"
    t.integer "shifts_worked", default: 0
  end

  create_table "people", force: :cascade do |t|
    t.string "home_phone"
    t.string "work_phone"
    t.date "dob"
    t.integer "gender", default: 3
    t.string "other_gender"
    t.string "emergency_contact"
    t.string "emergency_phone"
    t.string "emergency_relationship"
    t.string "emergency_phone_other"
    t.integer "organization_id", default: 0
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "kind", null: false
    t.datetime "start", null: false
    t.datetime "finish", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.index ["person_id"], name: "index_shifts_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "bio"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "contactmethod", default: 3
    t.integer "contact_method", default: 0
    t.float "latitude"
    t.float "longitude"
    t.string "street_address"
    t.float "donated", default: 0.0
    t.string "actable_type"
    t.integer "actable_id"
    t.index ["actable_type", "actable_id"], name: "index_users_on_actable_type_and_actable_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
