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

ActiveRecord::Schema.define(:version => 20111202044637) do

  create_table "appointments", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "hosiptal_name"
    t.string   "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approve_status"
  end

  create_table "doctor_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "nationality",     :limit => 15
    t.string   "father_name",     :limit => 50
    t.string   "mother_name",     :limit => 50
    t.text     "per_address"
    t.string   "per_city"
    t.string   "per_zip"
    t.text     "contact_address"
    t.string   "con_city"
    t.string   "con_zip"
    t.string   "marital_status"
    t.string   "relegion"
    t.string   "college_name"
    t.string   "college_city"
    t.string   "college_state"
    t.string   "highest_degree"
    t.string   "register_no"
    t.datetime "year_passed"
    t.datetime "date_of_birth"
    t.integer  "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctor_patients", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_images", :force => true do |t|
    t.string   "image"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatment_forms", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.date     "date"
    t.string   "complaints"
    t.integer  "rating"
    t.boolean  "aggravating_factors"
    t.text     "aggravating_factors_text"
    t.boolean  "new_injuries"
    t.text     "new_injuries_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "my_file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.datetime "date_of_birth"
    t.text     "postal_address"
    t.string   "marital_status"
    t.string   "occupation"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_relation"
    t.string   "emergency_contact_address"
    t.string   "emergency_contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ethnicity"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "title"
    t.string   "home_number"
    t.string   "mobile_number"
    t.string   "office_number"
    t.string   "company_name"
    t.integer  "master_id"
    t.integer  "site_id"
    t.boolean  "terms_and_conditions"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
