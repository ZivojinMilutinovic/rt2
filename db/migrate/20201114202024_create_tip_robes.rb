class CreateTipRobes < ActiveRecord::Migration[6.0]
  def change
    create_table :tip_robes do |t|
      t.string :naziv
      t.string :oznaka
      t.integer :user_id
    end
  end
end
