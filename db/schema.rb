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

ActiveRecord::Schema.define(version: 20170205135323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "type"
    t.string "code"
    t.boolean "contra", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "aggregate_account_id"
    t.index ["aggregate_account_id"], name: "index_accounts_on_aggregate_account_id"
    t.index ["name"], name: "index_accounts_on_name"
    t.index ["type"], name: "index_accounts_on_type"
  end

  create_table "amounts", id: :serial, force: :cascade do |t|
    t.string "type"
    t.integer "account_id"
    t.integer "entry_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_amounts_on_account_id_and_entry_id"
    t.index ["account_id"], name: "index_amounts_on_account_id"
    t.index ["entry_id", "account_id"], name: "index_amounts_on_entry_id_and_account_id"
    t.index ["entry_id"], name: "index_amounts_on_entry_id"
    t.index ["type"], name: "index_amounts_on_type"
  end

  create_table "approvals", id: :serial, force: :cascade do |t|
    t.integer "approvable_id"
    t.string "approvable_type"
    t.datetime "date"
    t.string "remarks"
    t.string "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "approver_id"
    t.string "approver_type"
    t.index ["approvable_id"], name: "index_approvals_on_approvable_id"
    t.index ["approvable_type"], name: "index_approvals_on_approvable_type"
    t.index ["approver_id"], name: "index_approvals_on_approver_id"
    t.index ["approver_type"], name: "index_approvals_on_approver_type"
    t.index ["type"], name: "index_approvals_on_type"
  end

  create_table "approvers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_approvers_on_type"
    t.index ["user_id"], name: "index_approvers_on_user_id"
  end

  create_table "branches", id: :serial, force: :cascade do |t|
    t.integer "cooperative_id"
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_type"
    t.string "slug"
    t.index ["branch_type"], name: "index_branches_on_branch_type"
    t.index ["cooperative_id"], name: "index_branches_on_cooperative_id"
    t.index ["slug"], name: "index_branches_on_slug", unique: true
  end

  create_table "businesses", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "name"
    t.string "contact_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_businesses_on_owner_id"
    t.index ["owner_type"], name: "index_businesses_on_owner_type"
  end

  create_table "carts", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "contributions", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.decimal "amount"
    t.datetime "date"
    t.integer "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_contributions_on_entry_id"
    t.index ["member_id"], name: "index_contributions_on_member_id"
  end

  create_table "cooperatives", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "accreditation_number"
    t.string "address"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_departments_on_branch_id"
  end

  create_table "disbursements", id: :serial, force: :cascade do |t|
    t.integer "disbursementable_id"
    t.string "disbursementable_type"
    t.datetime "date"
    t.string "reference_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disbursementable_id"], name: "index_disbursements_on_disbursementable_id"
    t.index ["disbursementable_type"], name: "index_disbursements_on_disbursementable_type"
    t.index ["user_id"], name: "index_disbursements_on_user_id"
  end

  create_table "discounts", id: :serial, force: :cascade do |t|
    t.integer "discountable_id"
    t.string "discountable_type"
    t.integer "discount_type"
    t.decimal "amount"
    t.decimal "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_type"], name: "index_discounts_on_discount_type"
    t.index ["discountable_id"], name: "index_discounts_on_discountable_id"
    t.index ["discountable_type"], name: "index_discounts_on_discountable_type"
  end

  create_table "entries", id: :serial, force: :cascade do |t|
    t.string "reference_number"
    t.datetime "entry_date"
    t.string "commercial_document_type"
    t.integer "commercial_document_id"
    t.string "description"
    t.integer "recorder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_entries_on_branch_id"
    t.index ["commercial_document_id"], name: "index_entries_on_commercial_document_id"
    t.index ["commercial_document_type"], name: "index_entries_on_commercial_document_type"
    t.index ["recorder_id"], name: "index_entries_on_recorder_id"
  end

  create_table "fees", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "amount"
    t.string "name"
    t.integer "feeable_id"
    t.string "feeable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeable_id"], name: "index_fees_on_feeable_id"
    t.index ["feeable_type"], name: "index_fees_on_feeable_type"
  end

  create_table "freights", id: :serial, force: :cascade do |t|
    t.string "type"
    t.integer "freightable_id"
    t.string "freightable_type"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freightable_id"], name: "index_freights_on_freightable_id"
    t.index ["freightable_type"], name: "index_freights_on_freightable_type"
    t.index ["type"], name: "index_freights_on_type"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "line_items", id: :serial, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "order_id"
    t.decimal "quantity"
    t.decimal "unit_cost"
    t.integer "pricing_type"
    t.integer "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "type"
    t.integer "itemable_id"
    t.string "itemable_type"
    t.integer "orderable_id"
    t.string "orderable_type"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["orderable_id"], name: "index_line_items_on_orderable_id"
    t.index ["orderable_type"], name: "index_line_items_on_orderable_type"
    t.index ["stock_id"], name: "index_line_items_on_stock_id"
    t.index ["type"], name: "index_line_items_on_type"
    t.index ["user_id"], name: "index_line_items_on_user_id"
  end

  create_table "loan_products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "interest_rate"
    t.integer "status"
    t.decimal "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "loan_product_id"
    t.decimal "amount"
    t.datetime "application_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_number"
    t.decimal "term"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_loans_on_branch_id"
    t.index ["loan_product_id"], name: "index_loans_on_loan_product_id"
    t.index ["member_id"], name: "index_loans_on_member_id"
    t.index ["tracking_number"], name: "index_loans_on_tracking_number"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.integer "sex"
    t.integer "civil_status"
    t.date "date_of_birth"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "slug"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_members_on_branch_id"
    t.index ["slug"], name: "index_members_on_slug", unique: true
  end

  create_table "occupations", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current"
    t.index ["member_id"], name: "index_occupations_on_member_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "pay_type"
    t.datetime "order_date"
    t.string "reference_number"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "type"
    t.index ["member_id"], name: "index_orders_on_member_id"
    t.index ["type"], name: "index_orders_on_type"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pg_search_documents", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "product_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "stock_alert", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_category_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "programs", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "contribution_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
    t.integer "cooperative_id"
    t.index ["cooperative_id"], name: "index_programs_on_cooperative_id"
  end

  create_table "refunds", id: :serial, force: :cascade do |t|
    t.integer "refundable_id"
    t.string "refundable_type"
    t.decimal "amount"
    t.integer "refund_type"
    t.decimal "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["refund_type"], name: "index_refunds_on_refund_type"
    t.index ["refundable_id"], name: "index_refunds_on_refundable_id"
    t.index ["refundable_type"], name: "index_refunds_on_refundable_type"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.integer "relationee_id"
    t.integer "relationer_id"
    t.integer "relationship_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationee_id", "relationer_id"], name: "index_relationships_on_relationee_id_and_relationer_id", unique: true
    t.index ["relationee_id"], name: "index_relationships_on_relationee_id"
    t.index ["relationer_id"], name: "index_relationships_on_relationer_id"
    t.index ["relationship_type"], name: "index_relationships_on_relationship_type"
  end

  create_table "savings", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "savings_product_id"
    t.datetime "date_opened"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["account_number"], name: "index_savings_on_account_number"
    t.index ["branch_id"], name: "index_savings_on_branch_id"
    t.index ["member_id"], name: "index_savings_on_member_id"
    t.index ["savings_product_id"], name: "index_savings_on_savings_product_id"
  end

  create_table "savings_products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "interest_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "share_capital_products", id: :serial, force: :cascade do |t|
    t.decimal "minimum_paid_up_share_capital"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "share_capitals", id: :serial, force: :cascade do |t|
    t.string "account_number"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_share_capitals_on_branch_id"
    t.index ["member_id"], name: "index_share_capitals_on_member_id"
    t.index ["type"], name: "index_share_capitals_on_type"
  end

  create_table "stocks", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.decimal "quantity"
    t.datetime "date_purchased"
    t.decimal "purchase_cost"
    t.string "reference_number"
    t.datetime "expiry_date"
    t.decimal "retail_price"
    t.decimal "wholesale_price"
    t.integer "payment_type"
    t.boolean "discounted", default: false
    t.boolean "has_freight", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id"
    t.string "bar_code"
    t.integer "user_id"
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["supplier_id"], name: "index_stocks_on_supplier_id"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_subscriptions_on_member_id"
    t.index ["program_id"], name: "index_subscriptions_on_program_id"
  end

  create_table "suppliers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_deposit_products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "interest_rate"
    t.decimal "starting"
    t.decimal "ending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_deposits", id: :serial, force: :cascade do |t|
    t.integer "member_id"
    t.integer "time_deposit_product_id"
    t.decimal "amount"
    t.datetime "date_deposited"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_time_deposits_on_branch_id"
    t.index ["member_id"], name: "index_time_deposits_on_member_id"
    t.index ["time_deposit_product_id"], name: "index_time_deposits_on_time_deposit_product_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "role"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "department_id"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amounts", "accounts"
  add_foreign_key "amounts", "entries"
  add_foreign_key "approvers", "users"
  add_foreign_key "branches", "cooperatives"
  add_foreign_key "carts", "users"
  add_foreign_key "contributions", "entries"
  add_foreign_key "contributions", "members"
  add_foreign_key "departments", "branches"
  add_foreign_key "disbursements", "users"
  add_foreign_key "entries", "branches"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "stocks"
  add_foreign_key "line_items", "users"
  add_foreign_key "loans", "branches"
  add_foreign_key "loans", "loan_products"
  add_foreign_key "loans", "members"
  add_foreign_key "members", "branches"
  add_foreign_key "occupations", "members"
  add_foreign_key "orders", "members"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "programs", "cooperatives"
  add_foreign_key "savings", "branches"
  add_foreign_key "savings", "members"
  add_foreign_key "savings", "savings_products"
  add_foreign_key "share_capitals", "branches"
  add_foreign_key "share_capitals", "members"
  add_foreign_key "stocks", "products"
  add_foreign_key "stocks", "suppliers"
  add_foreign_key "stocks", "users"
  add_foreign_key "subscriptions", "members"
  add_foreign_key "subscriptions", "programs"
  add_foreign_key "time_deposits", "branches"
  add_foreign_key "time_deposits", "members"
  add_foreign_key "time_deposits", "time_deposit_products"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "departments"
end
