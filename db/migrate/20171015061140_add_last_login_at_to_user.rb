class AddLastLoginAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_login_at, :datetime
  end
end
