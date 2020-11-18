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

ActiveRecord::Schema.define(version: 2020_11_17_223850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devizas", force: :cascade do |t|
    t.integer "sifra_valute"
    t.string "drzava"
    t.string "oznaka_valute"
    t.integer "vazi_za"
    t.string "country_code"
    t.index ["oznaka_valute"], name: "index_devizas_on_oznaka_valute"
  end

  create_table "jedinica_meres", force: :cascade do |t|
    t.string "naziv"
    t.string "oznaka"
  end

  create_table "konto1_klasas", force: :cascade do |t|
    t.string "naziv"
    t.integer "klasa"
    t.string "bilans"
    t.string "aktivnost"
    t.integer "user_id"
  end

  create_table "konto2_grupas", force: :cascade do |t|
    t.integer "konto1_klasa_id"
    t.string "naziv"
    t.integer "grupa"
    t.integer "user_id"
    t.index ["konto1_klasa_id"], name: "index_konto2_grupas_on_konto1_klasa_id"
  end

  create_table "konto3_sintetikas", force: :cascade do |t|
    t.integer "konto2_grupa_id"
    t.string "naziv"
    t.string "konto"
    t.integer "user_id"
    t.index ["konto2_grupa_id"], name: "index_konto3_sintetikas_on_konto2_grupa_id"
  end

  create_table "konto4_objekti_prometas", force: :cascade do |t|
    t.integer "konto3_sintetika_id"
    t.string "naziv"
    t.integer "sifra_cetvrti_broj"
    t.string "objekat"
    t.string "tip"
    t.boolean "ispravka"
    t.integer "user_id"
    t.index ["konto3_sintetika_id"], name: "index_konto4_objekti_prometas_on_konto3_sintetika_id"
  end

  create_table "konto5_racunis", force: :cascade do |t|
    t.integer "konto4_objekti_prometa_id"
    t.string "naziv"
    t.string "analitika"
    t.string "pozicija_ks_ispravka"
    t.integer "user_id"
    t.index ["konto4_objekti_prometa_id"], name: "index_konto5_racunis_on_konto4_objekti_prometa_id"
  end

  create_table "korisnicis", force: :cascade do |t|
    t.integer "opsti"
    t.string "naziv_firme"
    t.string "oblik_organizovanja"
    t.string "knjigovodstvo"
    t.integer "sifra"
    t.string "mesto_sedista"
    t.string "adresa"
    t.string "posta"
    t.integer "pib"
    t.integer "sifra_delatnosti"
    t.integer "maticni_broj"
    t.datetime "pocetak_rada"
    t.string "kontakt_osoba"
    t.string "prezime_ime"
    t.string "mesto_stanovanja"
    t.string "funkcija"
    t.string "ovlascenje_polozaj"
    t.integer "telefon_fiksni"
    t.integer "telefon_mobilni"
    t.integer "fax"
    t.string "email"
    t.string "tekuci_racun"
    t.string "broj_racuna"
    t.string "tip"
    t.string "namena"
    t.string "banka"
    t.integer "pdv_aktivnost"
    t.integer "pdv_broj"
    t.datetime "zavrsni_datum_pdv"
    t.string "poreski_period"
    t.string "org_jedinica_pogoni"
    t.string "naziv"
    t.string "lokacija_mesto"
    t.string "adresa_ulice"
    t.string "kontakt"
    t.integer "user_id"
  end

  create_table "magacinis", force: :cascade do |t|
    t.integer "objekti_id"
    t.string "naziv"
    t.string "zalihe"
    t.string "adresa"
    t.string "lokacija"
    t.integer "sifra"
    t.integer "konto"
    t.string "oznaka"
    t.integer "user_id"
  end

  create_table "partneris", force: :cascade do |t|
    t.string "opsti_podaci"
    t.string "naziv"
    t.integer "sifra"
    t.string "tip"
    t.string "sediste"
    t.string "adresa"
    t.string "kontakt"
    t.string "status"
    t.integer "pib"
    t.string "tekuci"
    t.string "pdv"
    t.integer "user_id"
  end

  create_table "poreske_tarives", force: :cascade do |t|
    t.integer "tarifa"
    t.string "naziv"
    t.string "stopa"
    t.datetime "poc_dat"
    t.datetime "zav_dat"
    t.integer "user_id"
  end

  create_table "robas", force: :cascade do |t|
    t.integer "analitika_racuna_id"
    t.string "naziv"
    t.integer "sifra"
    t.string "oznaka"
    t.string "kat_broj"
    t.string "jedinica_mere"
    t.integer "poreska_tarifa"
    t.string "pakovanje"
    t.integer "user_id"
  end

  create_table "tip_robes", force: :cascade do |t|
    t.string "naziv"
    t.string "oznaka"
    t.integer "user_id"
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
