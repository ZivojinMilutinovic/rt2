class AddIdOznakaObjektaPrometas < ActiveRecord::Migration[6.0]
  def change
    add_column :oznaka_objekta_prometas,:user_id,:integer
  end
end
