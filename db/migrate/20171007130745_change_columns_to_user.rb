class ChangeColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_digest, :string
    add_column :users, :password, :string
  end
end
