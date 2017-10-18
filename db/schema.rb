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

ActiveRecord::Schema.define(version: 20171017225926) do

  create_table "defects", force: :cascade do |t|
    t.integer "iterations_id"
    t.string "defect_no"
    t.string "rtc"
    t.string "qc"
    t.string "config"
    t.boolean "data_mapping_def"
    t.boolean "pc_changes_def"
    t.boolean "plugin_changes"
    t.boolean "ia_changes"
    t.boolean "db_changes_def"
    t.boolean "external_changes_def"
    t.text "workarounds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "iteration_id"
    t.integer "owner_id"
    t.index ["iteration_id"], name: "index_defects_on_iteration_id"
    t.index ["iterations_id"], name: "index_defects_on_iterations_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.string "interaction_name"
    t.string "interface"
    t.string "notes_from_release"
    t.boolean "data_mapping"
    t.string "rrc_version"
    t.boolean "plt_crossline_dep"
    t.string "plt_dep_dets"
    t.boolean "pc_changes"
    t.string "pc_changes_type"
    t.boolean "plugin_changes"
    t.string "plug_changes_type"
    t.boolean "ia_changes"
    t.string "ia_changes_type"
    t.boolean "db_script"
    t.string "db_script_type"
    t.boolean "external_changes"
    t.string "external_changes_type"
    t.string "issues_defects"
    t.text "workarounds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "iteration_id"
    t.integer "owner_id"
    t.index ["iteration_id"], name: "index_interactions_on_iteration_id"
  end

  create_table "iterations", force: :cascade do |t|
    t.string "iteration_number"
    t.string "drop_number"
    t.date "date_of_drop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "line_name"
    t.string "line_work"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
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
    t.string "user"
    t.integer "line_id"
    t.integer "iteration_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["iteration_id"], name: "index_users_on_iteration_id"
    t.index ["line_id"], name: "index_users_on_line_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
