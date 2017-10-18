class RenameMonsterDataIdToMonsterDatumId < ActiveRecord::Migration[5.1]
  def change
    rename_column :monster_details, :monster_data_id, :monster_datum_id
  end
end
