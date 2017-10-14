class AddColumnToMonsterDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :monster_details, :hp_left, :integer
  end
end
