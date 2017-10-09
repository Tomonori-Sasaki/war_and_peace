class AddColumnsToMonsterDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :monster_details, :having_flag, :integer
    add_column :monster_details, :had_flag, :integer
    add_column :monster_details, :seen_flag, :integer
  end
end
