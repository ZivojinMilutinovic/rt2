class CreatePromenes < ActiveRecord::Migration[6.0]
  def change
    create_table :promenes do |t|
      t.string :promena_tip_naziv
      t.string :naziv
      t.boolean :pdv_odbitak
      t.boolean :ks
      t.integer :user_id
    end
    create_table :promet_dokumentas do |t|
      t.integer :nalog_gk
      t.string :dokument
      t.string :izdavalac_imenilac
      t.string :broj_oznaka_period
      t.datetime :datum_prometa
      t.string :iznos_bruto
      t.string :korekcija
      t.integer :user_id

    end
    create_table :transakcijes do |t|
      t.integer :r_br
      t.string :grupa
      t.string :naziv
      t.boolean :oporezivo
      t.integer :user_id
    end
    create_table :transakcije_grupes do |t|
      t.integer :r_br
      t.string :oblast
      t.string :naziv
      t.integer :user_id
    end
    create_table :transakcije_oblastis do |t|
      t.integer :r_br
      t.string :oznaka
      t.string :naziv
      t.integer :user_id
    end
    create_table :dokuments do |t|
      t.string :transakcija
      t.string :klasa_forma
      t.string :naziv
      t.string :tip_c
      t.string :obrazac
    end
    create_table :proceduras do |t|
      t.string :naziv
      t.string :opis
      t.string :tehnika
      t.string :izvor_izdavalac
      t.integer :user_id
    end
    create_table :dokument_klasas do |t|
      t.string :procedura
      t.string :naziv
      t.string :promena
      t.string :forma
      t.integer :user_id
    end
  end
end
