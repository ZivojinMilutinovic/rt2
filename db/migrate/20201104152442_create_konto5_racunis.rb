class CreateKonto5Racunis < ActiveRecord::Migration[6.0]
  def change
    create_table :konto5_racunis do |t|
      t.integer :konto4_objekti_prometa_id
      t.string :naziv
      t.string :analitika
      t.string :pozicija_ks_ispravka
    end
    add_index :konto5_racunis,:konto4_objekti_prometa_id
  end
end
