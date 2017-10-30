class AddCaptureCoefficientToMonsterData < ActiveRecord::Migration[5.1]
  def change
    add_column :monster_data, :capture_coefficient, :float
  end
end
