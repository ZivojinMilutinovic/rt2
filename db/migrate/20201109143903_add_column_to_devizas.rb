class AddColumnToDevizas < ActiveRecord::Migration[6.0]
  def change
    add_column :devizas,:country_code,:string
  end
end
