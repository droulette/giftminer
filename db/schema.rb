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

ActiveRecord::Schema.define(:version => 20130110043645) do

  create_table "category_product_links", :force => true do |t|
    t.integer  "product_cat_id"
    t.integer  "product_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "category_product_links", ["product_cat_id"], :name => "index_category_product_links_on_product_cat_id"
  add_index "category_product_links", ["product_id"], :name => "index_category_product_links_on_product_id"

  create_table "ocats", :force => true do |t|
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ocats_occassions", :force => true do |t|
    t.integer "ocat_id"
    t.integer "occassion_id"
  end

  add_index "ocats_occassions", ["ocat_id"], :name => "index_ocats_occassions_on_ocat_id"
  add_index "ocats_occassions", ["occassion_id"], :name => "index_ocats_occassions_on_occassion_id"

  create_table "occassions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.integer  "user_id"
    t.string   "price_range"
    t.string   "type_of_gift"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "occassions", ["user_id"], :name => "index_occassions_on_user_id"

  create_table "product_cats", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.string   "gender"
    t.string   "age_range"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "category"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "occassion_id"
  end

  add_index "recommendations", ["product_id"], :name => "index_recommendations_on_product_id"
  add_index "recommendations", ["user_id"], :name => "index_recommendations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
