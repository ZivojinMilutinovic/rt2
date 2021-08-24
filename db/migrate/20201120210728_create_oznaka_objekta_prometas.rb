class CreateOznakaObjektaPrometas < ActiveRecord::Migration[6.0]
  def change
    create_table :oznaka_objekta_prometas do |t|
      t.string :naziv_oznake
      t.string :oznaka
    end
  end
end
