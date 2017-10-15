class AddColumnToSkillDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :skill_details, :pp_left, :integer
  end
end
