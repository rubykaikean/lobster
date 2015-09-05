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

ActiveRecord::Schema.define(version: 20150904053214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "display_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "slug"
    t.string   "username"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["slug"], name: "index_admins_on_slug", unique: true, using: :btree

  create_table "buyers", force: :cascade do |t|
    t.string   "full_name"
    t.string   "ic_number"
    t.text     "address"
    t.string   "mobile_contact_number"
    t.string   "home_contact_number"
    t.string   "office_contact_number"
    t.string   "email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "gender"
    t.string   "slug"
    t.boolean  "is_bumi_putera",        default: false
    t.integer  "sources_type_id"
    t.integer  "race"
    t.integer  "age"
    t.integer  "region_id"
    t.string   "buyer_second_name"
    t.string   "buyer_third_name"
    t.string   "second_ic_number"
    t.string   "third_ic_number"
    t.integer  "nationality_id"
    t.integer  "postcode"
    t.string   "car_park"
  end

  add_index "buyers", ["nationality_id"], name: "index_buyers_on_nationality_id", using: :btree
  add_index "buyers", ["region_id"], name: "index_buyers_on_region_id", using: :btree
  add_index "buyers", ["slug"], name: "index_buyers_on_slug", unique: true, using: :btree
  add_index "buyers", ["sources_type_id"], name: "index_buyers_on_sources_type_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "registration_number", limit: 15
    t.text     "address"
    t.string   "phone_number",        limit: 15
    t.string   "fax_number",          limit: 15
    t.integer  "type_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "status_id",                      default: 1
  end

  add_index "companies", ["parent_id"], name: "index_companies_on_parent_id", using: :btree
  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true, using: :btree

  create_table "company_settings", force: :cascade do |t|
    t.integer  "company_id"
    t.boolean  "allow_multiple_booking", default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "company_settings", ["company_id"], name: "index_company_settings_on_company_id", using: :btree

  create_table "email_settings", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "subject"
    t.string   "from"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "email_settings", ["product_id"], name: "index_email_settings_on_product_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enquiry_fields", force: :cascade do |t|
    t.integer  "enquiry_id"
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "floor_plans", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "product_id"
  end

  add_index "floor_plans", ["product_id"], name: "index_floor_plans_on_product_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "lots", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_id"
    t.string   "slug"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "product_type_id"
    t.integer  "status_id",               default: 1
    t.integer  "land_area_square_meter",  default: 0
    t.integer  "land_area_square_feet",   default: 0
    t.integer  "extra_land_square_meter", default: 0
    t.integer  "extra_land_square_feet",  default: 0
    t.integer  "premium"
    t.integer  "extra_land_price",        default: 0
    t.integer  "selling_price",           default: 0
    t.integer  "row_key",                 default: 1
    t.boolean  "is_special_unit",         default: false
  end

  add_index "lots", ["product_id"], name: "index_lots_on_product_id", using: :btree
  add_index "lots", ["product_type_id"], name: "index_lots_on_product_type_id", using: :btree
  add_index "lots", ["slug"], name: "index_lots_on_slug", unique: true, using: :btree

  create_table "molpay_transaction_histories", force: :cascade do |t|
    t.integer  "order_id"
    t.float    "amount"
    t.boolean  "is_paid"
    t.boolean  "status"
    t.string   "bill_name"
    t.string   "bill_email"
    t.string   "bill_mobile"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "sale_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status_id"
    t.integer  "project_id"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "phases", ["project_id"], name: "index_phases_on_project_id", using: :btree
  add_index "phases", ["slug"], name: "index_phases_on_slug", unique: true, using: :btree

  create_table "product_settings", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "allow_multiple_booking",            default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "unit_per_row",                      default: 5
    t.boolean  "notify_buyer_on_sale_confirmation", default: false
    t.boolean  "notify_admin_on_sale_confirmation", default: false
    t.integer  "bumiputera_discount",               default: 5
    t.boolean  "attach_payment_image",              default: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_id"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "land_area_square_meter",  default: 0
    t.integer  "land_area_square_feet",   default: 0
    t.integer  "extra_land_square_meter", default: 0
    t.integer  "extra_land_square_feet",  default: 0
    t.integer  "extra_land_price",        default: 0
  end

  add_index "product_types", ["product_id"], name: "index_product_types_on_product_id", using: :btree
  add_index "product_types", ["slug"], name: "index_product_types_on_slug", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_id"
    t.text     "description"
    t.integer  "status_id"
    t.integer  "phase_id"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_published",   default: false
    t.integer  "company_id"
    t.string   "e_brochure_url"
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree
  add_index "products", ["phase_id"], name: "index_products_on_phase_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status_id"
    t.integer  "company_id"
    t.string   "slug"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_published", default: false
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "receipts", force: :cascade do |t|
    t.string   "skey"
    t.integer  "tran_id"
    t.string   "domain"
    t.string   "currency"
    t.datetime "paydate"
    t.string   "orderid"
    t.string   "appcode"
    t.string   "error_code"
    t.string   "error_desc"
    t.string   "channel"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
  end

  create_table "reservation_customizations", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "full_name",                       default: false
    t.boolean  "ic_number",                       default: false
    t.boolean  "address",                         default: false
    t.boolean  "mobile_contact_number",           default: false
    t.boolean  "home_contact_number",             default: false
    t.boolean  "office_contact_number",           default: false
    t.boolean  "email",                           default: false
    t.boolean  "gender",                          default: false
    t.boolean  "is_bumi_putera",                  default: false
    t.boolean  "race",                            default: false
    t.boolean  "age",                             default: false
    t.boolean  "buyer_second_name",               default: false
    t.boolean  "buyer_third_name",                default: false
    t.boolean  "second_ic_number",                default: false
    t.boolean  "third_ic_number",                 default: false
    t.boolean  "postcode",                        default: false
    t.boolean  "downpayment",                     default: false
    t.boolean  "downpayment_percentage",          default: false
    t.boolean  "spa",                             default: false
    t.boolean  "booking_fee",                     default: false
    t.boolean  "reject_reason",                   default: false
    t.boolean  "downpayment_type",                default: false
    t.boolean  "confirm_date",                    default: false
    t.boolean  "sale_date",                       default: false
    t.boolean  "selling_price",                   default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "full_name_required",              default: false
    t.boolean  "ic_number_required",              default: false
    t.boolean  "address_required",                default: false
    t.boolean  "mobile_contact_number_required",  default: false
    t.boolean  "home_contact_number_required",    default: false
    t.boolean  "office_contact_number_required",  default: false
    t.boolean  "email_required",                  default: false
    t.boolean  "gender_required",                 default: false
    t.boolean  "is_bumi_putera_required",         default: false
    t.boolean  "race_required",                   default: false
    t.boolean  "age_required",                    default: false
    t.boolean  "buyer_second_name_required",      default: false
    t.boolean  "buyer_third_name_required",       default: false
    t.boolean  "second_ic_number_required",       default: false
    t.boolean  "third_ic_number_required",        default: false
    t.boolean  "postcode_required",               default: false
    t.boolean  "downpayment_required",            default: false
    t.boolean  "downpayment_percentage_required", default: false
    t.boolean  "spa_required",                    default: false
    t.boolean  "booking_fee_required",            default: false
    t.boolean  "reject_reason_required",          default: false
    t.boolean  "downpayment_type_required",       default: false
    t.boolean  "confirm_date_required",           default: false
    t.boolean  "sale_date_required",              default: false
    t.boolean  "selling_price_required",          default: false
    t.boolean  "region_id",                       default: false
    t.boolean  "region_id_required",              default: false
    t.boolean  "nationality_id",                  default: false
    t.boolean  "nationality_id_required",         default: false
    t.boolean  "sources_type_id",                 default: false
    t.boolean  "sources_type_id_required",        default: false
    t.boolean  "sale_person",                     default: false
    t.boolean  "sale_person_required",            default: false
    t.boolean  "payment_type",                    default: false
    t.boolean  "payment_type_required",           default: false
    t.boolean  "car_park",                        default: false
    t.boolean  "car_park_required",               default: false
  end

  add_index "reservation_customizations", ["product_id"], name: "index_reservation_customizations_on_product_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "product_id"
    t.integer  "lot_unit_id"
    t.integer  "phase_id"
    t.integer  "user_id"
    t.integer  "status_id",              default: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "buyer_id"
    t.integer  "downpayment"
    t.integer  "downpayment_percentage"
    t.string   "bank_loan"
    t.string   "spa"
    t.integer  "booking_fee"
    t.string   "reject_reason"
    t.string   "downpayment_type"
    t.datetime "confirm_date"
    t.integer  "admin_confirm_user_id"
  end

  add_index "sales", ["buyer_id"], name: "index_sales_on_buyer_id", using: :btree
  add_index "sales", ["lot_unit_id"], name: "index_sales_on_lot_unit_id", using: :btree
  add_index "sales", ["phase_id"], name: "index_sales_on_phase_id", using: :btree
  add_index "sales", ["product_id"], name: "index_sales_on_product_id", using: :btree
  add_index "sales", ["project_id"], name: "index_sales_on_project_id", using: :btree
  add_index "sales", ["status_id"], name: "index_sales_on_status_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "site_plans", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "product_id"
  end

  add_index "site_plans", ["product_id"], name: "index_site_plans_on_product_id", using: :btree

  create_table "sources_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name"
    t.integer  "type_id"
    t.integer  "company_id"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.integer  "status_id",              default: 1
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
