class AddLastEventAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_event_at, :datetime
  end
end
