class AddUsersIdToKonto < ActiveRecord::Migration[6.0]
  def change
    add_column :konto1_klasas,:user_id,:integer
    add_column :konto2_grupas,:user_id,:integer
    add_column :konto3_sintetikas,:user_id,:integer
    add_column :konto4_objekti_prometas,:user_id,:integer
    add_column :konto5_racunis,:user_id,:integer
  end
end
