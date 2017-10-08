class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image_name
      t.integer :ball_num
      t.integer :level
      t.integer :exp

      t.timestamps
    end
  end
end
