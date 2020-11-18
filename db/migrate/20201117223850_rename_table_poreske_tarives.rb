class RenameTablePoreskeTarives < ActiveRecord::Migration[6.0]
  def change
    rename_table :poreske_tarifes,:poreske_tarives
  end
end
