class CreateSkillDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_details do |t|
      t.string :name
      t.integer :pp
      t.integer :power
      t.text :examination
      t.integer :monster_detail_id

      t.timestamps
    end
  end
end
