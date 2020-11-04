class CreateKonto2Grupas < ActiveRecord::Migration[6.0]
  def change
    create_table :konto2_grupas  do |t|
      t.integer :konto1_klasa_id
      t.string :naziv
      t.integer :grupa
    end
    add_index :konto2_grupas ,:konto1_klasa_id
  end
end
