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

ActiveRecord::Schema.define(version: 20141015124939) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interactions", force: true do |t|
    t.string   "description"
    t.integer  "interaction_id"
    t.string   "interaction_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interactions", ["interaction_id", "interaction_type"], name: "index_interactions_on_interaction_id_and_interaction_type"

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "meta_id"
    t.string   "meta_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["meta_id", "meta_type"], name: "index_users_on_meta_id_and_meta_type"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
