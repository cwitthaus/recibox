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

ActiveRecord::Schema.define(:version => 20121210173512) do

  create_table "ingredient_list_items", :force => true do |t|
    t.integer "recipe_id"
    t.float   "measurement_amount"
    t.string  "measurement_unit"
    t.integer "ingredient_id"
    t.string  "details"
  end

  add_index "ingredient_list_items", ["recipe_id", "ingredient_id"], :name => "index_ingredient_list_items_on_recipe_id_and_ingredient_id"

  create_table "ingredients", :force => true do |t|
    t.string "name"
    t.string "substitution"
  end

  add_index "ingredients", ["name"], :name => "index_ingredients_on_name"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "recipes", :force => true do |t|
    t.string   "title"
    t.string   "source"
    t.integer  "uploaded_user"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "recipes", ["uploaded_user", "title"], :name => "index_recipes_on_uploaded_user_and_title"

  create_table "steps", :force => true do |t|
    t.string  "instructions"
    t.integer "number"
    t.integer "recipe_id"
  end

  add_index "steps", ["recipe_id"], :name => "index_steps_on_recipe_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
