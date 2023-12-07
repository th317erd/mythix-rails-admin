# frozen_string_literal: true

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

# rubocop:disable all

ActiveRecord::Schema[7.1].define(version: 2023_12_07_203225) do
  create_table "users", force: :cascade do |t|
    t.string "email", limit: 100
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "phone", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

end
