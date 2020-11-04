class CreateKonto3Sintetikas < ActiveRecord::Migration[6.0]
  def change
    create_table :konto3_sintetikas do |t|
      t.integer :konto2_grupa_id
      t.string :naziv
      t.string :konto
    end
    add_index :konto3_sintetikas,:konto2_grupa_id
  end
end
