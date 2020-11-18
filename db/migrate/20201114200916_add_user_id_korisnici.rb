class AddUserIdKorisnici < ActiveRecord::Migration[6.0]
  def change
    add_column :korisnicis,:user_id,:integer
  end
end
