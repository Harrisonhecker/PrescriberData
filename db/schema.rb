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

ActiveRecord::Schema.define(version: 2021_11_06_192401) do

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Month1NRxDoctor"
    t.integer "Month2NRxDoctor"
    t.integer "Month3NRxDoctor"
    t.integer "Month4NRxDoctor"
    t.integer "Month5NRxDoctor"
    t.integer "Month6NRxDoctor"
    t.integer "Month1TRxDoctor"
    t.integer "Month2TRxDoctor"
    t.integer "Month3TRxDoctor"
    t.integer "Month4TRxDoctor"
    t.integer "Month5TRxDoctor"
    t.integer "Month6TRxDoctor"
    t.integer "TotalNRxDoctor"
    t.integer "TotalTRxDoctor"
    t.integer "DoctorID"
    t.string "FirstName"
    t.string "LastName"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Month1NRxProduct"
    t.integer "Month2NRxProduct"
    t.integer "Month3NRxProduct"
    t.integer "Month4NRxProduct"
    t.integer "Month5NRxProduct"
    t.integer "Month6NRxProduct"
    t.integer "Month1TRxProduct"
    t.integer "Month2TRxProduct"
    t.integer "Month3TRxProduct"
    t.integer "Month4TRxProduct"
    t.integer "Month5TRxProduct"
    t.integer "Month6TRxProduct"
    t.integer "TotalNRxProduct"
    t.integer "TotalTRxProduct"
    t.integer "ProductID"
    t.string "ProductName"
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Month1NRxState"
    t.integer "Month2NRxState"
    t.integer "Month3NRxState"
    t.integer "Month4NRxState"
    t.integer "Month5NRxState"
    t.integer "Month6NRxState"
    t.integer "Month1TRxState"
    t.integer "Month2TRxState"
    t.integer "Month3TRxState"
    t.integer "Month4TRxState"
    t.integer "Month5TRxState"
    t.integer "Month6TRxState"
    t.integer "TotalNRxState"
    t.integer "TotalTRxState"
    t.integer "StateID"
    t.string "StateName"
  end

end
