class CreateKonto1Klasas < ActiveRecord::Migration[6.0]
  def change
    create_table :konto1_klasas do |t|
      t.string :naziv
      t.integer :klasa
      t.string :bilans
      t.string :aktivnost
    end
  end
end
