class AddPripadaKonto1KlasaUserBoolean < ActiveRecord::Migration[6.0]
  def change
    add_column :users,:resetuj_konto1_klasu,:boolean
  end
end
