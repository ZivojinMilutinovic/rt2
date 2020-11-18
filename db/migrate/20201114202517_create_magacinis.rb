class CreateMagacinis < ActiveRecord::Migration[6.0]
  def change
    create_table :magacinis do |t|
      t.integer :objekti_id
      t.string :naziv
      t.string :zalihe
      t.string :adresa
      t.string :lokacija
      t.integer :sifra
      t.integer :konto
      t.string :oznaka
      t.integer :user_id
    end
  end
end
