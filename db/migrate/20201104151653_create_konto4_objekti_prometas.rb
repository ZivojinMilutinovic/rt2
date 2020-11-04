class CreateKonto4ObjektiPrometas < ActiveRecord::Migration[6.0]
  def change
    create_table :konto4_objekti_prometas do |t|
      t.integer :konto3_sintetika_id
      t.string :naziv
      t.integer :sifra_cetvrti_broj
      t.string :objekat
      t.string :tip
      t.boolean :ispravka
    end
    add_index :konto4_objekti_prometas,:konto3_sintetika_id
  end
end
