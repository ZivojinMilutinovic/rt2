class CreatePromenaTips < ActiveRecord::Migration[6.0]
  def change
    create_table :promena_tips do |t|
      t.integer :transakcija
      t.string :naziv_promene_tip
      t.string :odobrenje_labela
      t.string :zaduzenje_labela
      t.boolean :dupli_stav
      t.boolean :pdv_odbitak
      t.string :analitika_vise_objekta
      t.boolean :oporezivo_pdv
      t.boolean :set_transakcija
      t.integer :user_id
    end
  end
end
