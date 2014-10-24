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

ActiveRecord::Schema.define(version: 20141023213853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cause_states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cause_types", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes", force: true do |t|
    t.string   "client"
    t.string   "id_number"
    t.string   "role"
    t.string   "court"
    t.string   "matter"
    t.string   "honorary"
    t.datetime "date"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "cause_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "causes", ["cause_type_id"], name: "index_causes_on_cause_type_id", using: :btree
  add_index "causes", ["client_id"], name: "index_causes_on_client_id", using: :btree
  add_index "causes", ["user_id"], name: "index_causes_on_user_id", using: :btree

  create_table "client_types", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "client_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["client_type_id"], name: "index_clients_on_client_type_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name_social_reason"
    t.string   "company_name"
    t.string   "company_id_number"
    t.string   "address"
    t.integer  "phone"
    t.string   "email"
    t.integer  "person_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["client_id"], name: "index_companies_on_client_id", using: :btree
  add_index "companies", ["person_id"], name: "index_companies_on_person_id", using: :btree

  create_table "journal_entries", force: true do |t|
    t.string   "action"
    t.datetime "date"
    t.integer  "cause_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal_entries", ["cause_state_id"], name: "index_journal_entries_on_cause_state_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "id_numbrer"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.text     "other"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["client_id"], name: "index_people_on_client_id", using: :btree

  create_table "user_causes", force: true do |t|
    t.integer  "user_id"
    t.integer  "cause_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_causes", ["cause_id"], name: "index_user_causes_on_cause_id", using: :btree
  add_index "user_causes", ["user_id"], name: "index_user_causes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "id_number"
    t.string   "email"
    t.string   "password"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

end
