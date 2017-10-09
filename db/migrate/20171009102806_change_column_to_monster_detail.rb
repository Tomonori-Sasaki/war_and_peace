class ChangeColumnToMonsterDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :monster_details, :monster_id, :integer
    add_column :monster_details, :monster_data_id, :integer
  end
end
