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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131202221258) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "client_products", :force => true do |t|
    t.integer  "client_id"
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "client_products", ["client_id"], :name => "index_client_products_on_client_id"
  add_index "client_products", ["product_id"], :name => "index_client_products_on_product_id"

  create_table "client_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "client_types", ["name"], :name => "index_client_types_on_name", :unique => true

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "nif"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "person_in_charge"
    t.string   "location"
    t.string   "postal_code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "client_type_id"
  end

  add_index "clients", ["client_type_id"], :name => "index_clients_on_client_type_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "news_text",  :limit => 4294967295
    t.string   "source"
    t.string   "image"
    t.boolean  "is_active",                        :default => true
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "slug"
  end

  add_index "news", ["slug"], :name => "index_news_on_slug"

  create_table "payment_plans", :force => true do |t|
    t.integer  "client_id"
    t.integer  "service_modality_id"
    t.integer  "balance"
    t.datetime "initial_date"
    t.datetime "end_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "payment_plans", ["client_id"], :name => "index_payment_plans_on_client_id"
  add_index "payment_plans", ["service_modality_id"], :name => "index_payment_plans_on_service_modality_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "region"
    t.text     "description"
    t.string   "photo"
    t.string   "hashtag"
    t.integer  "category_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "is_active",          :default => 1
    t.string   "slug"
    t.integer  "is_special_product"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["is_special_product"], :name => "index_products_on_is_special_product"
  add_index "products", ["slug"], :name => "index_products_on_slug"

  create_table "service_modalities", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "service_modalities", ["name"], :name => "index_service_modalities_on_name", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
