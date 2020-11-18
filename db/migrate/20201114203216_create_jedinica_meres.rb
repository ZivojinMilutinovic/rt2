class CreateJedinicaMeres < ActiveRecord::Migration[6.0]
  def change
    create_table :jedinica_meres do |t|
      t.string :naziv
      t.string :oznaka
    end
  end
end
