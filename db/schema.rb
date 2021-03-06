# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140425025402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
  end

  create_table "emails", force: true do |t|
    t.string   "email_address"
    t.text     "body"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
  end

  create_table "houses", force: true do |t|
    t.integer  "price"
    t.string   "town"
    t.text     "description"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "url"
    t.string   "address"
    t.integer  "rating"
    t.string   "image"
  end

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "value",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
    t.integer  "cost",                     null: false
    t.integer  "location",                 null: false
    t.integer  "education",                null: false
    t.integer  "parking",                  null: false
    t.integer  "condition",                null: false
    t.integer  "spaciousness",             null: false
    t.integer  "bedrooms",                 null: false
    t.integer  "bathrooms",                null: false
    t.integer  "commute",                  null: false
    t.integer  "culture",                  null: false
  end

  create_table "textmessages", force: true do |t|
    t.datetime "date_time",    null: false
    t.string   "phone_number", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "house_id"
    t.string   "time_zone"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                            null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
