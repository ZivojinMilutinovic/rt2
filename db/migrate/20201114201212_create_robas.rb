class CreateRobas < ActiveRecord::Migration[6.0]
  def change
    create_table :robas do |t|
      t.integer :analitika_racuna_id
      t.string :naziv
      t.integer :sifra
      t.string :oznaka
      t.string :kat_broj
      t.string :jedinica_mere
      t.integer :poreska_tarifa
      t.string :pakovanje
      t.integer :user_id
      
    end
  end
end
