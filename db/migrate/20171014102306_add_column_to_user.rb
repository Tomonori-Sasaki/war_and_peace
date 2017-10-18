class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gold, :integer
  end
end
