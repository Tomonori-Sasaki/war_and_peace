class RemoveColumnsFromMonsterDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :monster_details, :tech1, :integer
    remove_column :monster_details, :tech2, :integer
    remove_column :monster_details, :tech3, :integer
    remove_column :monster_details, :tech4, :integer
  end
end
