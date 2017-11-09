class AddExchangeToMonsterDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :monster_details, :exchange, :string
  end
end
