class AddSkillDatumIdToSkillDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :skill_details, :skill_datum_id, :integer
  end
end
