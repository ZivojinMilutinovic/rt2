class CreateKorisnicis < ActiveRecord::Migration[6.0]
  def change
    create_table :korisnicis do |t|
      t.integer :opsti
      t.string :naziv_firme
      t.string :oblik_organizovanja
      t.string :knjigovodstvo
      t.integer :sifra
      t.string :mesto_sedista
      t.string :adresa
      t.string :posta
      t.integer :pib
      t.integer :sifra_delatnosti
      t.integer :maticni_broj
      t.datetime :pocetak_rada
      t.string :kontakt_osoba
      t.string :prezime_ime
      t.string :mesto_stanovanja
      t.string :funkcija
      t.string :ovlascenje_polozaj
      t.integer :telefon_fiksni
      t.integer :telefon_mobilni
      t.integer :fax
      t.string :email
      t.string :tekuci_racun
      t.string :broj_racuna
      t.string :tip
      t.string :namena
      t.string :banka
      t.integer :pdv_aktivnost
      t.integer :pdv_broj
      t.datetime :zavrsni_datum_pdv
      t.string :poreski_period
      t.string :org_jedinica_pogoni
      t.string :naziv
      t.string :lokacija_mesto
      t.string :adresa_ulice
      t.string :kontakt
    end
  end
end
