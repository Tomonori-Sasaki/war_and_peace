class DropTechTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :teches
  end
end
