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

ActiveRecord::Schema.define(version: 20140310193245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "antibodies", force: true do |t|
    t.string   "target",     null: false
    t.string   "antibody",   null: false
    t.string   "vendor",     null: false
    t.string   "product",    null: false
    t.string   "isotype",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flowprotocols", force: true do |t|
    t.string   "cell",                  null: false
    t.string   "fixation",              null: false
    t.string   "incubation",            null: false
    t.string   "permeabilization",      null: false
    t.string   "cell_number",           null: false
    t.string   "first_wash",            null: false
    t.string   "immunostain_vol",       null: false
    t.string   "primary_description",   null: false
    t.string   "second_wash",           null: false
    t.string   "secondary_description", null: false
    t.string   "third_wash",            null: false
    t.string   "final_vol",             null: false
    t.string   "information",           null: false
    t.integer  "user_id",               null: false
    t.integer  "antibody_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flowprotocols", ["user_id", "antibody_id", "created_at"], name: "index_flowprotocols_on_user_id_and_antibody_id_and_created_at", using: :btree

  create_table "ibprotocols", force: true do |t|
    t.string   "cell_tissue",           null: false
    t.string   "lysis",                 null: false
    t.string   "sonication",            null: false
    t.string   "sample_size",           null: false
    t.string   "sample_loading",        null: false
    t.string   "gel",                   null: false
    t.string   "electrophoresis",       null: false
    t.string   "membrane",              null: false
    t.string   "transfer",              null: false
    t.string   "blocking",              null: false
    t.string   "primary_description",   null: false
    t.string   "first_wash",            null: false
    t.string   "secondary_description", null: false
    t.string   "second_wash",           null: false
    t.string   "detection",             null: false
    t.string   "information",           null: false
    t.integer  "user_id",               null: false
    t.integer  "antibody_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "blot"
  end

  add_index "ibprotocols", ["user_id", "antibody_id", "created_at"], name: "index_ibprotocols_on_user_id_and_antibody_id_and_created_at", using: :btree

  create_table "ifprotocols", force: true do |t|
    t.string   "cell",                  null: false
    t.string   "fixation",              null: false
    t.string   "first_wash",            null: false
    t.string   "blocking",              null: false
    t.string   "primary_description",   null: false
    t.string   "second_wash",           null: false
    t.string   "secondary_description", null: false
    t.string   "third_wash",            null: false
    t.string   "coverslip",             null: false
    t.string   "information",           null: false
    t.integer  "user_id",               null: false
    t.integer  "antibody_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "blot"
  end

  add_index "ifprotocols", ["user_id", "antibody_id", "created_at"], name: "index_ifprotocols_on_user_id_and_antibody_id_and_created_at", using: :btree

  create_table "ihcprotocols", force: true do |t|
    t.string   "tissue",              null: false
    t.string   "fixation",            null: false
    t.string   "first_wash",          null: false
    t.string   "methpero",            null: false
    t.string   "second_wash",         null: false
    t.string   "blocking",            null: false
    t.string   "primary_description", null: false
    t.string   "third_wash",          null: false
    t.string   "signal",              null: false
    t.string   "fourth_wash",         null: false
    t.string   "dehydration",         null: false
    t.string   "mounting",            null: false
    t.string   "information",         null: false
    t.integer  "user_id",             null: false
    t.integer  "antibody_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "blot"
  end

  add_index "ihcprotocols", ["user_id", "antibody_id", "created_at"], name: "index_ihcprotocols_on_user_id_and_antibody_id_and_created_at", using: :btree

  create_table "ipreprotocols", force: true do |t|
    t.string   "cell",                  null: false
    t.string   "lysis",                 null: false
    t.string   "sonication",            null: false
    t.string   "sample_concentration",  null: false
    t.string   "preclearing",           null: false
    t.string   "primary_description",   null: false
    t.string   "ab_capture",            null: false
    t.string   "first_wash",            null: false
    t.string   "sample_prep",           null: false
    t.string   "gel",                   null: false
    t.string   "electrophoresis",       null: false
    t.string   "membrane",              null: false
    t.string   "transfer",              null: false
    t.string   "blocking",              null: false
    t.string   "secondary_description", null: false
    t.string   "second_wash",           null: false
    t.string   "tertiary_description",  null: false
    t.string   "third_wash",            null: false
    t.string   "detection",             null: false
    t.string   "information",           null: false
    t.integer  "user_id",               null: false
    t.integer  "antibody_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ipreprotocols", ["user_id", "antibody_id", "created_at"], name: "index_ipreprotocols_on_user_id_and_antibody_id_and_created_at", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "rs_evaluations", force: true do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree

  create_table "rs_reputation_messages", force: true do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree

  create_table "rs_reputations", force: true do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree

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
    t.string   "image"
    t.string   "name"
    t.string   "occupation"
    t.string   "interests"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
