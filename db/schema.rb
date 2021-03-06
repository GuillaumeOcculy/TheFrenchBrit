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

ActiveRecord::Schema.define(version: 20150717220045) do

  create_table "castings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.string   "media_type"
    t.string   "video_provider"
    t.string   "video_reference"
    t.integer  "priority"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.string   "casting_type"
  end

  add_index "castings", ["slug"], name: "index_castings_on_slug", unique: true
  add_index "castings", ["user_id"], name: "index_castings_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.integer  "priority"
  end

  add_index "partners", ["slug"], name: "index_partners_on_slug", unique: true

  create_table "settings", force: :cascade do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "description"
    t.string   "footer_title"
    t.string   "studio_title"
    t.text     "studio_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.string  "email"
    t.boolean "is_admin",        default: false
    t.string  "password_digest"
    t.string  "password_token"
    t.string  "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

end
