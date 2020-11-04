# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_04_175933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "konto1_klasas", force: :cascade do |t|
    t.string "naziv"
    t.integer "klasa"
    t.string "bilans"
    t.string "aktivnost"
  end

  create_table "konto2_grupas", force: :cascade do |t|
    t.integer "konto1_klasa_id"
    t.string "naziv"
    t.integer "grupa"
    t.index ["konto1_klasa_id"], name: "index_konto2_grupas_on_konto1_klasa_id"
  end

  create_table "konto3_sintetikas", force: :cascade do |t|
    t.integer "konto2_grupa_id"
    t.string "naziv"
    t.string "konto"
    t.index ["konto2_grupa_id"], name: "index_konto3_sintetikas_on_konto2_grupa_id"
  end

  create_table "konto4_objekti_prometas", force: :cascade do |t|
    t.integer "konto3_sintetika_id"
    t.string "naziv"
    t.integer "sifra_cetvrti_broj"
    t.string "objekat"
    t.string "tip"
    t.boolean "ispravka"
    t.index ["konto3_sintetika_id"], name: "index_konto4_objekti_prometas_on_konto3_sintetika_id"
  end

  create_table "konto5_racunis", force: :cascade do |t|
    t.integer "konto4_objekti_prometa_id"
    t.string "naziv"
    t.string "analitika"
    t.string "pozicija_ks_ispravka"
    t.index ["konto4_objekti_prometa_id"], name: "index_konto5_racunis_on_konto4_objekti_prometa_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "session_token"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
