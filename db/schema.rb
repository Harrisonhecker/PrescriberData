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

ActiveRecord::Schema.define(version: 2021_11_06_145811) do

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Month1NRx"
    t.integer "Month2NRx"
    t.integer "Month3NRx"
    t.integer "Month4NRx"
    t.integer "Month5NRx"
    t.integer "Month6NRx"
    t.integer "Month1TRx"
    t.integer "Month2TRx"
    t.integer "Month3TRx"
    t.integer "Month4TRx"
    t.integer "Month5TRx"
    t.integer "Month6TRx"
    t.integer "TotalNRx"
    t.integer "TotalTRx"
  end

end
