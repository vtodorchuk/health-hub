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

ActiveRecord::Schema[7.0].define(version: 2023_05_26_184811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "analyzes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "service_id", null: false
    t.boolean "intake_forms", default: false, null: false
    t.boolean "online", default: false, null: false
    t.string "status", default: "pending"
    t.decimal "duration", default: "15.0"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.boolean "doctor_accepted", default: false, null: false
    t.boolean "patient_accepted", default: false, null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_bookings_on_clinic_id"
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id"
    t.index ["patient_id"], name: "index_bookings_on_patient_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "chat_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_users_on_chat_id"
    t.index ["clinic_id"], name: "index_chat_users_on_clinic_id"
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_chats_on_clinic_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "label"
    t.string "tooltip"
    t.string "city"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.text "body"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "clinic_id"
    t.index ["doctor_id"], name: "index_contracts_on_doctor_id"
    t.index ["patient_id"], name: "index_contracts_on_patient_id"
  end

  create_table "examinations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "max_value"
    t.string "min_value"
    t.string "illness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_cards", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "clinic_id"
    t.index ["user_id"], name: "index_medical_cards_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["clinic_id"], name: "index_messages_on_clinic_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.bigint "target_id"
    t.string "second_target_type"
    t.bigint "second_target_id"
    t.string "third_target_type"
    t.bigint "third_target_id"
    t.datetime "read_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "report_analyzes", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "analyze_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analyze_id"], name: "index_report_analyzes_on_analyze_id"
    t.index ["report_id"], name: "index_report_analyzes_on_report_id"
  end

  create_table "report_examinations", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "examination_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_report_examinations_on_examination_id"
    t.index ["report_id"], name: "index_report_examinations_on_report_id"
  end

  create_table "report_fields", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_report_fields_on_field_id"
    t.index ["report_id"], name: "index_report_fields_on_report_id"
  end

  create_table "report_medicines", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "medicine_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicine_id"], name: "index_report_medicines_on_medicine_id"
    t.index ["report_id"], name: "index_report_medicines_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.bigint "clinic_id", null: false
    t.text "illnesses"
    t.string "status"
    t.integer "blood_pressure"
    t.integer "pulse"
    t.float "temperature"
    t.boolean "complications", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_reports_on_clinic_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_services_on_clinic_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "phone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clinic_id"
    t.index ["clinic_id"], name: "index_users_on_clinic_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "clinics"
  add_foreign_key "bookings", "services"
  add_foreign_key "bookings", "users", column: "doctor_id"
  add_foreign_key "bookings", "users", column: "patient_id"
  add_foreign_key "chat_users", "chats"
  add_foreign_key "chat_users", "clinics"
  add_foreign_key "chat_users", "users"
  add_foreign_key "chats", "clinics"
  add_foreign_key "contracts", "clinics"
  add_foreign_key "contracts", "users", column: "doctor_id"
  add_foreign_key "contracts", "users", column: "patient_id"
  add_foreign_key "medical_cards", "clinics"
  add_foreign_key "medical_cards", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "clinics"
  add_foreign_key "messages", "users"
  add_foreign_key "report_analyzes", "analyzes"
  add_foreign_key "report_analyzes", "reports"
  add_foreign_key "report_examinations", "examinations"
  add_foreign_key "report_examinations", "reports"
  add_foreign_key "report_fields", "fields"
  add_foreign_key "report_fields", "reports"
  add_foreign_key "report_medicines", "medicines"
  add_foreign_key "report_medicines", "reports"
  add_foreign_key "reports", "clinics"
  add_foreign_key "reports", "users", column: "doctor_id"
  add_foreign_key "reports", "users", column: "patient_id"
  add_foreign_key "services", "clinics"
  add_foreign_key "services", "users"
  add_foreign_key "users", "clinics"
end
