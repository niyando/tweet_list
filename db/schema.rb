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

ActiveRecord::Schema.define(version: 20171015062650) do

  create_table "compilations", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "fave_count",  limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "compilations", ["user_id"], name: "index_compilations_on_user_id", using: :btree

  create_table "favourite_compilations", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "compilation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favourite_compilations", ["compilation_id"], name: "fk_rails_440fb69f3c", using: :btree
  add_index "favourite_compilations", ["user_id", "compilation_id"], name: "user_fav", unique: true, using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "compilation_id", limit: 4
    t.string   "link",           limit: 255, null: false
    t.string   "title",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["compilation_id"], name: "index_tweets_on_compilation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.string   "nickname",   limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "compilations", "users"
  add_foreign_key "favourite_compilations", "compilations"
  add_foreign_key "favourite_compilations", "users"
  add_foreign_key "tweets", "compilations"
end
