class CreatePoreskeTarifes < ActiveRecord::Migration[6.0]
  def change
    create_table :poreske_tarifes do |t|
      t.integer :tarifa
      t.string :naziv
      t.string :stopa
      t.datetime :poc_dat
      t.datetime :zav_dat
      t.integer :user_id
    end
  end
end
