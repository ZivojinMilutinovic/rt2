class CreatePartneris < ActiveRecord::Migration[6.0]
  def change
    create_table :partneris do |t|
      t.string :opsti_podaci
      t.string :naziv
      t.integer :sifra
      t.string :tip
      t.string :sediste
      t.string :adresa
      t.string :kontakt
      t.string :status
      t.integer :pib
      t.string :tekuci
      t.string :pdv
      t.integer :user_id
    end
  end
end
