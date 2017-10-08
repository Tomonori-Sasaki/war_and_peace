class CreateMonsterDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :monster_details do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :speed
      t.integer :hp_add
      t.integer :attack_add
      t.integer :defence_add
      t.integer :speed_add
      t.integer :level
      t.integer :exp
      t.integer :tech1
      t.integer :tech2
      t.integer :tech3
      t.integer :tech4
      t.string :type
      t.integer :user_id
      t.integer :monster_id
      t.integer :have_flag

      t.timestamps
    end
  end
end
