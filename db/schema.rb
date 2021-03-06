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

ActiveRecord::Schema.define(version: 20180309032150) do

  create_table "it_skills", force: :cascade do |t|
    t.string   "ITimage"
    t.string   "ITName"
    t.integer  "user_id"
    t.string   "existence"
    t.string   "educate"
    t.string   "Field"
    t.string   "Itgenre"
    t.integer  "Accession"
    t.integer  "Resident"
    t.string   "TypeIndustry"
    t.integer  "dgpn"
    t.integer  "dbweb"
    t.integer  "dbopen"
    t.integer  "dbnclusion"
    t.integer  "dbfirmware"
    t.integer  "dbcontrol"
    t.integer  "frequency"
    t.string   "ITRemarks"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "it_skills", ["user_id", "created_at"], name: "index_it_skills_on_user_id_and_created_at"
  add_index "it_skills", ["user_id"], name: "index_it_skills_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "it_skill_id"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ownerships", ["it_skill_id"], name: "index_ownerships_on_it_skill_id"
  add_index "ownerships", ["user_id"], name: "index_ownerships_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "RecruitEmail"
    t.string   "email"
    t.string   "password_digest"
    t.string   "listing"
    t.date     "Establishment"
    t.integer  "Capitalstock"
    t.string   "area"
    t.integer  "zipcode"
    t.string   "dwelling"
    t.string   "BuildName"
    t.integer  "TelNam"
    t.integer  "fax"
    t.string   "UserAttribut"
    t.datetime "DateTime"
    t.text     "Profile"
    t.string   "Specialty"
    t.string   "BusinessArea"
    t.string   "officialhp"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
