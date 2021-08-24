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

ActiveRecord::Schema.define(version: 2021_06_18_092011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "devizas", force: :cascade do |t|
    t.integer "sifra_valute"
    t.string "drzava"
    t.string "oznaka_valute"
    t.integer "vazi_za"
    t.string "country_code"
    t.index ["oznaka_valute"], name: "index_devizas_on_oznaka_valute"
  end

  create_table "dokument_klasas", force: :cascade do |t|
    t.string "procedura"
    t.string "naziv"
    t.string "promena"
    t.string "forma"
    t.integer "user_id"
  end

  create_table "dokuments", force: :cascade do |t|
    t.string "transakcija"
    t.string "klasa_forma"
    t.string "naziv"
    t.string "tip_c"
    t.string "obrazac"
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

  create_table "oznaka_objekta_prometas", force: :cascade do |t|
    t.string "naziv_oznake"
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

  create_table "proceduras", force: :cascade do |t|
    t.string "naziv"
    t.string "opis"
    t.string "tehnika"
    t.string "izvor_izdavalac"
    t.integer "user_id"
  end

  create_table "promena_tips", force: :cascade do |t|
    t.integer "transakcija"
    t.string "naziv_promene_tip"
    t.string "odobrenje_labela"
    t.string "zaduzenje_labela"
    t.boolean "dupli_stav"
    t.boolean "pdv_odbitak"
    t.string "analitika_vise_objekta"
    t.boolean "oporezivo_pdv"
    t.boolean "set_transakcija"
    t.integer "user_id"
  end

  create_table "promenes", force: :cascade do |t|
    t.string "promena_tip_naziv"
    t.string "naziv"
    t.boolean "pdv_odbitak"
    t.boolean "ks"
    t.integer "user_id"
  end

  create_table "promet_dokumentas", force: :cascade do |t|
    t.integer "nalog_gk"
    t.string "dokument"
    t.string "izdavalac_imenilac"
    t.string "broj_oznaka_period"
    t.datetime "datum_prometa"
    t.string "iznos_bruto"
    t.string "korekcija"
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

  create_table "subs", force: :cascade do |t|
  end

  create_table "tip_robes", force: :cascade do |t|
    t.string "naziv"
    t.string "oznaka"
    t.integer "user_id"
  end

  create_table "transakcije_grupes", force: :cascade do |t|
    t.integer "r_br"
    t.string "oblast"
    t.string "naziv"
    t.integer "user_id"
  end

  create_table "transakcije_oblastis", force: :cascade do |t|
    t.integer "r_br"
    t.string "oznaka"
    t.string "naziv"
    t.integer "user_id"
  end

  create_table "transakcijes", force: :cascade do |t|
    t.integer "r_br"
    t.string "grupa"
    t.string "naziv"
    t.boolean "oporezivo"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "session_token"
    t.boolean "resetuj_konto1_klasu"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
