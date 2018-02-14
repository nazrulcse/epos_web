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

ActiveRecord::Schema.define(version: 20180214052530) do

  create_table "access_rights", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.text     "permissions",        limit: 65535
    t.text     "custom_permissions", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "access_rights", ["employee_id"], name: "index_access_rights_on_employee_id", using: :btree

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attendance_attendance_logs", force: :cascade do |t|
    t.string   "ip_address",    limit: 255
    t.integer  "attendance_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attendance_attendances", force: :cascade do |t|
    t.date     "in_date"
    t.datetime "in_time"
    t.datetime "out_time"
    t.decimal  "duration",                precision: 10
    t.integer  "employee_id",   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "department_id", limit: 4
  end

  create_table "attendance_day_offs", force: :cascade do |t|
    t.integer  "year",          limit: 4
    t.date     "date"
    t.string   "day_off_type",  limit: 255
    t.decimal  "hours",                     precision: 10
    t.string   "title",         limit: 255
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.string   "number",        limit: 255
    t.string   "bank_name",     limit: 255
    t.string   "bank_branch",   limit: 255
    t.float    "balance",       limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "bank_accounts", ["department_id"], name: "index_bank_accounts_on_department_id", using: :btree

  create_table "changed_settings", force: :cascade do |t|
    t.time     "open_time"
    t.time     "close_time"
    t.float    "working_hours", limit: 24
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "department_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "changed_settings", ["department_id"], name: "fk_rails_70c51b74b1", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.string  "image",         limit: 255
    t.integer "employee_id",   limit: 4
    t.string  "mobile",        limit: 255
    t.string  "contact_email", limit: 255
    t.string  "address",       limit: 255
    t.string  "city",          limit: 255
    t.string  "state",         limit: 255
    t.string  "zip_code",      limit: 255
    t.string  "country",       limit: 255
    t.string  "next_path",     limit: 255
  end

  create_table "company_features", force: :cascade do |t|
    t.integer  "feature_id", limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "subject",    limit: 65535
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id",  limit: 4
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.integer  "company_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "address",     limit: 65535
    t.string   "slug",        limit: 255
    t.string   "city",        limit: 255
    t.string   "state",       limit: 255
    t.string   "zip_code",    limit: 255
    t.string   "country",     limit: 255
    t.string   "email",       limit: 255
    t.string   "mobile",      limit: 255
  end

  create_table "designations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active",                   default: false
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "email",                       limit: 255,   default: "",      null: false
    t.string   "encrypted_password",          limit: 255,   default: ""
    t.string   "reset_password_token",        limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",          limit: 255
    t.string   "last_sign_in_ip",             limit: 255
    t.string   "confirmation_token",          limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",           limit: 255
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "first_name",                  limit: 255
    t.string   "last_name",                   limit: 255
    t.text     "note",                        limit: 65535
    t.string   "location",                    limit: 255
    t.date     "dob"
    t.text     "address",                     limit: 65535
    t.string   "gender",                      limit: 255
    t.string   "image",                       limit: 255
    t.integer  "department_id",               limit: 4
    t.string   "role",                        limit: 255,   default: "staff"
    t.string   "invitation_token",            limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",            limit: 4
    t.integer  "invited_by_id",               limit: 4
    t.string   "invited_by_type",             limit: 255
    t.string   "blood_group",                 limit: 255
    t.date     "joining_date"
    t.integer  "designation_id",              limit: 4
    t.float    "basic_salary",                limit: 24
    t.string   "mobile",                      limit: 255
    t.string   "nid",                         limit: 255
    t.string   "kin_name",                    limit: 255
    t.string   "kin_contact",                 limit: 255
    t.boolean  "is_active",                                 default: true
    t.integer  "deactivated_by",              limit: 4
    t.date     "deactivate_date"
    t.string   "id_card_no",                  limit: 255
    t.string   "employee_type",               limit: 255
    t.string   "present_address",             limit: 255
    t.string   "permanent_address",           limit: 255
    t.string   "color",                       limit: 255
    t.string   "slug",                        limit: 255
    t.string   "kin_relationship",            limit: 255
    t.string   "marital_status",              limit: 255
    t.string   "nationality",                 limit: 255
    t.string   "country",                     limit: 255
    t.string   "attachment",                  limit: 255
    t.string   "bank_account_number",         limit: 255
    t.text     "bank_details",                limit: 65535
    t.string   "previous_employment_history", limit: 255
    t.string   "religion",                    limit: 255
    t.string   "user_id",                     limit: 255
  end

  add_index "employees", ["confirmation_token"], name: "index_employees_on_confirmation_token", unique: true, using: :btree
  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["invitation_token"], name: "index_employees_on_invitation_token", unique: true, using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  add_index "employees", ["user_id"], name: "index_employees_on_user_id", unique: true, using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.float    "cost",        limit: 24
    t.text     "description", limit: 65535
    t.string   "app_module",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "url",         limit: 255
    t.string   "logo",        limit: 255
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pos_customers", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "company",               limit: 255
    t.string   "address",               limit: 255
    t.string   "city",                  limit: 255
    t.string   "email",                 limit: 255
    t.string   "mobile",                limit: 255
    t.integer  "department_id",         limit: 4
    t.float    "initial_balance",       limit: 24
    t.string   "nid",                   limit: 255
    t.text     "nid_image",             limit: 65535
    t.string   "passport_no",           limit: 255
    t.text     "passport_image",        limit: 65535
    t.string   "driving_licence",       limit: 255
    t.text     "driving_licence_image", limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "category_id",           limit: 4
    t.float    "credit_limit",          limit: 24
    t.boolean  "is_active",                           default: true
  end

  add_index "pos_customers", ["category_id"], name: "index_pos_customers_on_category_id", using: :btree
  add_index "pos_customers", ["department_id"], name: "index_pos_customers_on_department_id", using: :btree

  create_table "pos_customers_categories", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "pos_customers_categories", ["department_id"], name: "index_pos_customers_categories_on_department_id", using: :btree

  create_table "pos_customers_invoice_items", force: :cascade do |t|
    t.integer  "department_id",     limit: 4
    t.integer  "invoice_id",        limit: 4
    t.integer  "product_id",        limit: 4
    t.text     "note",              limit: 65535
    t.float    "cost_price",        limit: 24
    t.float    "sale_price",        limit: 24
    t.float    "whole_sale",        limit: 24
    t.integer  "quantity",          limit: 4
    t.float    "amount",            limit: 24
    t.float    "discount",          limit: 24
    t.float    "vat",               limit: 24
    t.float    "total",             limit: 24
    t.text     "attachment",        limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "global_id",         limit: 255
    t.string   "invoice_global_id", limit: 255
  end

  add_index "pos_customers_invoice_items", ["department_id"], name: "index_pos_customers_invoice_items_on_department_id", using: :btree
  add_index "pos_customers_invoice_items", ["invoice_id"], name: "index_pos_customers_invoice_items_on_invoice_id", using: :btree
  add_index "pos_customers_invoice_items", ["product_id"], name: "index_pos_customers_invoice_items_on_product_id", using: :btree

  create_table "pos_customers_invoices", force: :cascade do |t|
    t.string   "number",         limit: 255
    t.date     "date"
    t.integer  "department_id",  limit: 4
    t.integer  "employee_id",    limit: 4
    t.integer  "customer_id",    limit: 4
    t.text     "note",           limit: 65535
    t.float    "amount",         limit: 24
    t.float    "discount",       limit: 24
    t.float    "vat",            limit: 24
    t.float    "total",          limit: 24
    t.text     "attachment",     limit: 65535
    t.string   "global_id",      limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_credit",                    default: false
    t.boolean  "is_advance",                   default: false
    t.boolean  "is_complete",                  default: false
    t.float    "advance_paid",   limit: 24
    t.float    "transport_cost", limit: 24
  end

  add_index "pos_customers_invoices", ["customer_id"], name: "index_pos_customers_invoices_on_customer_id", using: :btree
  add_index "pos_customers_invoices", ["department_id"], name: "index_pos_customers_invoices_on_department_id", using: :btree
  add_index "pos_customers_invoices", ["employee_id"], name: "index_pos_customers_invoices_on_employee_id", using: :btree

  create_table "pos_customers_payments", force: :cascade do |t|
    t.integer  "department_id",     limit: 4
    t.integer  "employee_id",       limit: 4
    t.integer  "invoice_id",        limit: 4
    t.integer  "customer_id",       limit: 4
    t.date     "date"
    t.string   "payment_method",    limit: 255
    t.text     "note",              limit: 65535
    t.float    "amount",            limit: 24
    t.float    "discount",          limit: 24
    t.float    "total",             limit: 24
    t.string   "transaction_token", limit: 255
    t.text     "attachment",        limit: 65535
    t.string   "global_id",         limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.date     "value_date"
    t.string   "cheque_number",     limit: 255
    t.string   "bank_name",         limit: 255
    t.string   "bank_branch",       limit: 255
    t.string   "status",            limit: 255
    t.boolean  "confirmed",                       default: false
    t.boolean  "is_collection",                   default: false
    t.boolean  "is_group",                        default: false
    t.boolean  "account_payable",                 default: false
    t.float    "commission",        limit: 24
    t.integer  "bank_account_id",   limit: 4
    t.integer  "collected_by_id",   limit: 4
    t.integer  "cashier_id",        limit: 4
  end

  add_index "pos_customers_payments", ["bank_account_id"], name: "index_pos_customers_payments_on_bank_account_id", using: :btree
  add_index "pos_customers_payments", ["cashier_id"], name: "index_pos_customers_payments_on_cashier_id", using: :btree
  add_index "pos_customers_payments", ["collected_by_id"], name: "index_pos_customers_payments_on_collected_by_id", using: :btree
  add_index "pos_customers_payments", ["customer_id"], name: "index_pos_customers_payments_on_customer_id", using: :btree
  add_index "pos_customers_payments", ["department_id"], name: "index_pos_customers_payments_on_department_id", using: :btree
  add_index "pos_customers_payments", ["employee_id"], name: "index_pos_customers_payments_on_employee_id", using: :btree
  add_index "pos_customers_payments", ["invoice_id"], name: "index_pos_customers_payments_on_invoice_id", using: :btree

  create_table "pos_products", force: :cascade do |t|
    t.string   "code",            limit: 255
    t.string   "barcode",         limit: 255
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "department_id",   limit: 4
    t.integer  "category_id",     limit: 4
    t.integer  "sub_category_id", limit: 4
    t.integer  "model_id",        limit: 4
    t.integer  "brand_id",        limit: 4
    t.integer  "re_order_level",  limit: 4,     default: 0
    t.float    "cost_price",      limit: 24,    default: 0.0
    t.float    "sale_price",      limit: 24,    default: 0.0
    t.float    "whole_sale",      limit: 24,    default: 0.0
    t.boolean  "expirable",                     default: false
    t.boolean  "discountable",                  default: false
    t.integer  "stock",           limit: 4,     default: 0
    t.boolean  "is_active",                     default: true
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "supplier_id",     limit: 4
    t.string   "unit",            limit: 255
    t.string   "size",            limit: 255
    t.string   "color",           limit: 255
    t.boolean  "has_warranty"
    t.string   "warranty",        limit: 255
    t.boolean  "has_vat"
    t.float    "vat",             limit: 24
    t.float    "discount",        limit: 24
    t.string   "made_in",         limit: 255
  end

  add_index "pos_products", ["brand_id"], name: "index_pos_products_on_brand_id", using: :btree
  add_index "pos_products", ["category_id"], name: "index_pos_products_on_category_id", using: :btree
  add_index "pos_products", ["department_id"], name: "index_pos_products_on_department_id", using: :btree
  add_index "pos_products", ["model_id"], name: "index_pos_products_on_model_id", using: :btree
  add_index "pos_products", ["sub_category_id"], name: "index_pos_products_on_sub_category_id", using: :btree

  create_table "pos_products_brands", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active",                   default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pos_products_brands", ["department_id"], name: "index_pos_products_brands_on_department_id", using: :btree

  create_table "pos_products_categories", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active",                   default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pos_products_categories", ["department_id"], name: "index_pos_products_categories_on_department_id", using: :btree

  create_table "pos_products_models", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active",                   default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pos_products_models", ["department_id"], name: "index_pos_products_models_on_department_id", using: :btree

  create_table "pos_products_queue_codes", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.integer  "product_id",    limit: 4
    t.integer  "quantity",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "pos_products_queue_codes", ["department_id"], name: "index_pos_products_queue_codes_on_department_id", using: :btree
  add_index "pos_products_queue_codes", ["product_id"], name: "index_pos_products_queue_codes_on_product_id", using: :btree

  create_table "pos_products_sub_categories", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.integer  "department_id", limit: 4
    t.integer  "category_id",   limit: 4
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "is_active",                   default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pos_products_sub_categories", ["category_id"], name: "index_pos_products_sub_categories_on_category_id", using: :btree
  add_index "pos_products_sub_categories", ["department_id"], name: "index_pos_products_sub_categories_on_department_id", using: :btree

  create_table "pos_stocks", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "quantity",       limit: 4
    t.string   "stockable_id",   limit: 255
    t.string   "stockable_type", limit: 255
    t.string   "location_id",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pos_suppliers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "company",       limit: 255
    t.string   "address",       limit: 255
    t.string   "city",          limit: 255
    t.string   "email",         limit: 255
    t.string   "mobile",        limit: 255
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "is_active",                 default: true
  end

  add_index "pos_suppliers", ["department_id"], name: "index_pos_suppliers_on_department_id", using: :btree

  create_table "pos_suppliers_payments", force: :cascade do |t|
    t.integer  "department_id",     limit: 4
    t.integer  "employee_id",       limit: 4
    t.integer  "purchase_id",       limit: 4
    t.integer  "supplier_id",       limit: 4
    t.date     "date"
    t.string   "payment_method",    limit: 255
    t.text     "note",              limit: 65535
    t.float    "amount",            limit: 24
    t.float    "discount",          limit: 24
    t.float    "total",             limit: 24
    t.string   "transaction_token", limit: 255
    t.text     "attachment",        limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "pos_suppliers_payments", ["department_id"], name: "index_pos_suppliers_payments_on_department_id", using: :btree
  add_index "pos_suppliers_payments", ["employee_id"], name: "index_pos_suppliers_payments_on_employee_id", using: :btree
  add_index "pos_suppliers_payments", ["purchase_id"], name: "index_pos_suppliers_payments_on_purchase_id", using: :btree
  add_index "pos_suppliers_payments", ["supplier_id"], name: "index_pos_suppliers_payments_on_supplier_id", using: :btree

  create_table "pos_suppliers_purchase_items", force: :cascade do |t|
    t.integer  "purchase_id",       limit: 4
    t.integer  "product_id",        limit: 4
    t.integer  "issued_quantity",   limit: 4
    t.integer  "department_id",     limit: 4
    t.text     "note",              limit: 65535
    t.boolean  "is_received",                     default: false
    t.integer  "received_quantity", limit: 4
    t.float    "cost_price",        limit: 24
    t.float    "sale_price",        limit: 24
    t.float    "whole_sale",        limit: 24
    t.float    "amount",            limit: 24
    t.float    "discount",          limit: 24
    t.float    "vat",               limit: 24
    t.float    "total",             limit: 24
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "pos_suppliers_purchase_items", ["department_id"], name: "index_pos_suppliers_purchase_items_on_department_id", using: :btree
  add_index "pos_suppliers_purchase_items", ["product_id"], name: "index_pos_suppliers_purchase_items_on_product_id", using: :btree
  add_index "pos_suppliers_purchase_items", ["purchase_id"], name: "index_pos_suppliers_purchase_items_on_purchase_id", using: :btree

  create_table "pos_suppliers_purchases", force: :cascade do |t|
    t.string   "code",                 limit: 255
    t.date     "issue_date"
    t.date     "expected_delivery"
    t.integer  "department_id",        limit: 4
    t.integer  "issued_employee_id",   limit: 4
    t.integer  "received_employee_id", limit: 4
    t.integer  "supplier_id",          limit: 4
    t.text     "instruction",          limit: 65535
    t.boolean  "is_received",                        default: false
    t.date     "receive_date"
    t.float    "amount",               limit: 24
    t.float    "discount",             limit: 24
    t.float    "vat",                  limit: 24
    t.float    "total",                limit: 24
    t.text     "note",                 limit: 65535
    t.text     "attachment",           limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "pos_suppliers_purchases", ["department_id"], name: "index_pos_suppliers_purchases_on_department_id", using: :btree
  add_index "pos_suppliers_purchases", ["issued_employee_id"], name: "index_pos_suppliers_purchases_on_issued_employee_id", using: :btree
  add_index "pos_suppliers_purchases", ["received_employee_id"], name: "index_pos_suppliers_purchases_on_received_employee_id", using: :btree
  add_index "pos_suppliers_purchases", ["supplier_id"], name: "index_pos_suppliers_purchases_on_supplier_id", using: :btree

  create_table "profile_pictures", force: :cascade do |t|
    t.integer "employee_id", limit: 4
    t.string  "image",       limit: 255
    t.boolean "is_active"
  end

  create_table "settings", force: :cascade do |t|
    t.time     "open_time"
    t.time     "close_time"
    t.float    "working_hours", limit: 24
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "time_zone",     limit: 255, default: "UTC"
    t.string   "currency",      limit: 255
  end

  add_foreign_key "bank_accounts", "departments"
  add_foreign_key "changed_settings", "departments"
  add_foreign_key "pos_customers", "departments"
  add_foreign_key "pos_customers", "pos_customers_categories", column: "category_id"
  add_foreign_key "pos_customers_categories", "departments"
  add_foreign_key "pos_customers_invoice_items", "departments"
  add_foreign_key "pos_customers_invoice_items", "pos_customers_invoices", column: "invoice_id"
  add_foreign_key "pos_customers_invoice_items", "pos_products", column: "product_id"
  add_foreign_key "pos_customers_invoices", "departments"
  add_foreign_key "pos_customers_invoices", "employees"
  add_foreign_key "pos_customers_invoices", "pos_customers", column: "customer_id"
  add_foreign_key "pos_customers_payments", "bank_accounts"
  add_foreign_key "pos_customers_payments", "departments"
  add_foreign_key "pos_customers_payments", "employees"
  add_foreign_key "pos_customers_payments", "employees", column: "cashier_id"
  add_foreign_key "pos_customers_payments", "employees", column: "collected_by_id"
  add_foreign_key "pos_customers_payments", "pos_customers", column: "customer_id"
  add_foreign_key "pos_customers_payments", "pos_customers_invoices", column: "invoice_id"
  add_foreign_key "pos_products", "departments"
  add_foreign_key "pos_products", "pos_products_brands", column: "brand_id"
  add_foreign_key "pos_products", "pos_products_categories", column: "category_id"
  add_foreign_key "pos_products", "pos_products_models", column: "model_id"
  add_foreign_key "pos_products", "pos_products_sub_categories", column: "sub_category_id"
  add_foreign_key "pos_products_brands", "departments"
  add_foreign_key "pos_products_categories", "departments"
  add_foreign_key "pos_products_models", "departments"
  add_foreign_key "pos_products_queue_codes", "departments"
  add_foreign_key "pos_products_queue_codes", "pos_products", column: "product_id"
  add_foreign_key "pos_products_sub_categories", "departments"
  add_foreign_key "pos_products_sub_categories", "pos_products_categories", column: "category_id"
  add_foreign_key "pos_suppliers", "departments"
  add_foreign_key "pos_suppliers_payments", "departments"
  add_foreign_key "pos_suppliers_payments", "employees"
  add_foreign_key "pos_suppliers_payments", "pos_suppliers", column: "supplier_id"
  add_foreign_key "pos_suppliers_payments", "pos_suppliers_purchases", column: "purchase_id"
  add_foreign_key "pos_suppliers_purchase_items", "departments"
  add_foreign_key "pos_suppliers_purchase_items", "pos_products", column: "product_id"
  add_foreign_key "pos_suppliers_purchase_items", "pos_suppliers_purchases", column: "purchase_id"
  add_foreign_key "pos_suppliers_purchases", "departments"
  add_foreign_key "pos_suppliers_purchases", "employees", column: "issued_employee_id"
  add_foreign_key "pos_suppliers_purchases", "employees", column: "received_employee_id"
  add_foreign_key "pos_suppliers_purchases", "pos_suppliers", column: "supplier_id"
end
