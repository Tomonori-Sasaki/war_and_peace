class RemoveColumnsFromSkillDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :skill_details, :name, :string
    remove_column :skill_details, :pp, :integer
    remove_column :skill_details, :power, :integer
    remove_column :skill_details, :examination, :text
  end
end
