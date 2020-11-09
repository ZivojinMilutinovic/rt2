class CreateDevizes < ActiveRecord::Migration[6.0]
  def change
    create_table :devizas do |t|
      t.integer :sifra_valute
      t.string  :drzava
      t.string :oznaka_valute
      t.integer :vazi_za
    end
    add_index :devizas,:oznaka_valute
  end
end
