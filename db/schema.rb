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

ActiveRecord::Schema.define(version: 20161115191110) do

  create_table "activities", force: :cascade do |t|
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

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_emails", ["client_id"], name: "index_client_emails_on_client_id"

  create_table "client_phones", force: :cascade do |t|
    t.string   "phone"
    t.string   "ptype"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_phones", ["client_id"], name: "index_client_phones_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gcolors", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "invoice_numbers", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "next_number", default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "invoice_numbers", ["sale_id", "next_number"], name: "index_invoice_numbers_on_sale_id_and_next_number", unique: true
  add_index "invoice_numbers", ["sale_id"], name: "index_invoice_numbers_on_sale_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["order_id"], name: "index_items_on_order_id"

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "mcolors", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.string   "patient_name"
    t.integer  "age"
    t.string   "sex"
    t.text     "client_note"
    t.text     "other_note"
    t.boolean  "coti"
    t.integer  "total_price",   default: 0
    t.integer  "partial_pay",   default: 0
    t.integer  "total_pending"
    t.string   "state",         default: "En proceso"
    t.text     "null_concept"
    t.integer  "t1",            default: 0
    t.integer  "t2",            default: 0
    t.integer  "t3",            default: 0
    t.integer  "t4",            default: 0
    t.integer  "t5",            default: 0
    t.integer  "t6",            default: 0
    t.integer  "t7",            default: 0
    t.integer  "t8",            default: 0
    t.integer  "t9",            default: 0
    t.integer  "t10",           default: 0
    t.integer  "t11",           default: 0
    t.integer  "t12",           default: 0
    t.integer  "t13",           default: 0
    t.integer  "t14",           default: 0
    t.integer  "t15",           default: 0
    t.integer  "t16",           default: 0
    t.integer  "t17",           default: 0
    t.integer  "t18",           default: 0
    t.integer  "t19",           default: 0
    t.integer  "t20",           default: 0
    t.integer  "t21",           default: 0
    t.integer  "t22",           default: 0
    t.integer  "t23",           default: 0
    t.integer  "t24",           default: 0
    t.integer  "t25",           default: 0
    t.integer  "t26",           default: 0
    t.integer  "t27",           default: 0
    t.integer  "t28",           default: 0
    t.integer  "t29",           default: 0
    t.integer  "t30",           default: 0
    t.integer  "t31",           default: 0
    t.integer  "t32",           default: 0
    t.integer  "client_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount",       precision: 8, scale: 2
    t.string   "payment_type"
    t.integer  "sale_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "perno_price",              default: 0
    t.integer  "soldadura_price",          default: 0
    t.integer  "abuitment_price",          default: 0
    t.integer  "zirconio_price",           default: 0
    t.integer  "disilicato_price",         default: 0
    t.integer  "fedespatica_price",        default: 0
    t.integer  "porcelana_price",          default: 0
    t.integer  "pmma_price",               default: 0
    t.integer  "polimero_price",           default: 0
    t.integer  "composite_price",          default: 0
    t.integer  "metal_porcelana_price",    default: 0
    t.integer  "zirconio_porcelana_price", default: 0
    t.integer  "peek_price",               default: 0
    t.integer  "vita_classic_price",       default: 0
    t.integer  "vita_3d_price",            default: 0
    t.integer  "bioform_price",            default: 0
    t.integer  "chromarcop_price",         default: 0
    t.integer  "otras_price",              default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "patient_name"
    t.integer  "age"
    t.string   "sex"
    t.date     "order_date"
    t.string   "client_note"
    t.string   "other_note"
    t.boolean  "coti",                                     default: false
    t.integer  "invoice_num"
    t.date     "invoice_date"
    t.boolean  "paid_status",                              default: false
    t.string   "state",                                    default: "En proceso"
    t.string   "concept"
    t.decimal  "total_amount",     precision: 8, scale: 2, default: 0.0
    t.decimal  "discount",                                 default: 0.0
    t.decimal  "discount_amount",  precision: 8, scale: 2, default: 0.0
    t.decimal  "remaining_amount", precision: 8, scale: 2, default: 0.0
    t.decimal  "order_total",      precision: 8, scale: 2, default: 0.0
    t.integer  "client_id"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id"

  create_table "services", force: :cascade do |t|
    t.integer  "order_id"
    t.boolean  "antagonista",        default: false
    t.boolean  "foto",               default: false
    t.boolean  "mordida",            default: false
    t.integer  "quantity",           default: 0
    t.integer  "tooth_number"
    t.boolean  "corona",             default: false
    t.boolean  "puente",             default: false
    t.string   "puente_a"
    t.string   "puente_b"
    t.boolean  "implante",           default: false
    t.boolean  "barra",              default: false
    t.boolean  "hibrida",            default: false
    t.boolean  "carilla",            default: false
    t.boolean  "in_onlay",           default: false
    t.boolean  "inlay_bridge",       default: false
    t.boolean  "lente_contacto",     default: false
    t.boolean  "perno",              default: false
    t.boolean  "sold_laser",         default: false
    t.boolean  "cabutment",          default: false
    t.string   "cabutment_text"
    t.boolean  "vita_classic",       default: false
    t.boolean  "vita_td",            default: false
    t.boolean  "bioform",            default: false
    t.boolean  "chromarcop",         default: false
    t.boolean  "col_otras",          default: false
    t.string   "vita_classic_text"
    t.string   "vita_3d_text"
    t.string   "bioform_text"
    t.string   "chromarcop_text"
    t.string   "col_otras_text"
    t.boolean  "zirconio",           default: false
    t.boolean  "disilicato",         default: false
    t.boolean  "fedespatica",        default: false
    t.boolean  "porcelana",          default: false
    t.boolean  "pmma",               default: false
    t.boolean  "polimero",           default: false
    t.boolean  "composite",          default: false
    t.boolean  "metal_porcelana",    default: false
    t.boolean  "zirconio_porcelana", default: false
    t.boolean  "peek",               default: false
    t.boolean  "natural",            default: false
    t.boolean  "pimentado",          default: false
    t.boolean  "metal",              default: false
    t.boolean  "fresado_maquinado",  default: false
    t.boolean  "prensado",           default: false
    t.boolean  "colado",             default: false
    t.boolean  "cromo_cobalto",      default: false
    t.boolean  "titanium",           default: false
    t.boolean  "cromo_niquel",       default: false
    t.boolean  "oro",                default: false
    t.boolean  "paladio",            default: false
    t.integer  "service_total"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "stores", force: :cascade do |t|
    t.integer  "tooth"
    t.integer  "tooth_element"
    t.integer  "cant",                                  default: 1
    t.boolean  "antagonista",                           default: false
    t.boolean  "mordida",                               default: false
    t.string   "note"
    t.string   "color_note"
    t.boolean  "implant",                               default: false
    t.string   "brand"
    t.decimal  "amount",        precision: 8, scale: 2
    t.integer  "sale_id"
    t.integer  "worktype_id"
    t.integer  "material_id"
    t.integer  "mcolor_id"
    t.integer  "gcolor_id"
    t.integer  "procedure_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "stores", ["gcolor_id"], name: "index_stores_on_gcolor_id"
  add_index "stores", ["material_id"], name: "index_stores_on_material_id"
  add_index "stores", ["mcolor_id"], name: "index_stores_on_mcolor_id"
  add_index "stores", ["procedure_id"], name: "index_stores_on_procedure_id"
  add_index "stores", ["sale_id"], name: "index_stores_on_sale_id"
  add_index "stores", ["worktype_id"], name: "index_stores_on_worktype_id"

  create_table "supplier_emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "supplier_emails", ["supplier_id"], name: "index_supplier_emails_on_supplier_id"

  create_table "supplier_phones", force: :cascade do |t|
    t.string   "phone"
    t.string   "ptype"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "supplier_phones", ["supplier_id"], name: "index_supplier_phones_on_supplier_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "role_level",             default: 0
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "worktypes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
