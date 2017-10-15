class CreateSkillData < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_data do |t|
      t.string :name
      t.integer :pp
      t.integer :power
      t.integer :accuracy
      t.string :type
      t.text :examination

      t.timestamps
    end
  end
end
